class AddSessionDigest < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remember_digest, :string
    add_column :users, :remember_digest_salt, :string
    add_column :users, :password_salt, :string
  end
end
