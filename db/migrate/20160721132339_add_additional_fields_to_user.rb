class AddAdditionalFieldsToUser < ActiveRecord::Migration
  def up
    add_column :users, :username, :string unless column_exists?(:users, :username)
    add_column :users, :nickname, :string unless column_exists?(:users, :nickname)
    add_column :users, :provider, :string unless column_exists?(:users, :provider)
    add_column :users, :url,:string unless column_exists?(:users, :url)

    User.reset_column_information
  end

  def down
    remove_column :users, :username if column_exists?(:users, :username)
    remove_column :users, :nickname if column_exists?(:users, :nickname)
    remove_column :users, :provider if column_exists?(:users, :provider)
    remove_column :users, :url if column_exists?(:users, :url)
  end
end
