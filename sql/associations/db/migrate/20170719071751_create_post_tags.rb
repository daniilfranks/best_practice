class CreatePostTags < ActiveRecord::Migration[5.1]
  def change
  	create_table :post_tags do |t|
  	  t.string :name
  	  t.integer :post_id
  	  t.integer :tag_id
  	end
  end
end
