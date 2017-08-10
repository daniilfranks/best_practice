class CreatePosts < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |post|
      post.string :title
      post.string :description
      post.timestamps
  	end
  end
end
