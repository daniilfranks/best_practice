class CreateBooks < ActiveRecord::Migration[5.1]
  def change
  	create_table :books do |t|
      t.string :title
      t.string :email
      t.float :price
      t.string :status, default: false
  	end
  end
end
