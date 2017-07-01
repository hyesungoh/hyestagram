class CreateHashtagsPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hashtags_posts do |t|
      t.integer :post_id
      t.integer :hashtag_id
    end
  end
end
