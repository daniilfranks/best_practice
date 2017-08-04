class CreateAddIndexToPosts < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, :user_id
  end
end
