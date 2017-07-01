Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  post 'posts/create'

  get 'posts/delete/:post_id' => "posts#delete"

  get 'posts/edit/:post_id' => "posts#edit"

  post '/comments/create/:post_id' => 'comments#create'

  get '/comments/delete/:comment_id' => 'comments#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
