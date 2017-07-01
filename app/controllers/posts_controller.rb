class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all.reverse
    @comments = Comment.all.reverse
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  def create
    post = Post.new
    post.title = params[:input_title]
    post.content = params[:input_content]
    post.user_id = current_user.id

    hashtags = params[:hashtags].split(",")
    hashtags.each do |onetag|
      hashtag = Hashtag.find_or_create_by(name: onetag.delete('#'))
      hashtag.save
      post.hashtags << hashtag
    end

    uploader = ImageuploaderUploader.new
    uploader.store!(params[:image])
    post.image_url = uploader.url

    post.save
    redirect_to '/'
  end

  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to '/'
  end

  def edit
    post = Post.find(params[:post_id])
    post.title = params[:input_title]
    post.content = params[:input_content]
    post.hashtags = []

    hashtags = params[:hashtags].split(",")
    hashtags.each do |onetag|
      hashtag = Hashtag.find_or_create_by(name: onetag.delete('#'))
      hashtag.save
      post.hashtags << hashtag
    end

    post.save
    redirect_to '/'
  end
end
