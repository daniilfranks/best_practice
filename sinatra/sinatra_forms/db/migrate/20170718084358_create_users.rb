class CreateUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
      t.string  :name
      t.integer :jobs
  	end
  end
end
