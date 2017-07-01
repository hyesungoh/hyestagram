class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :image_url, default: ""
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
