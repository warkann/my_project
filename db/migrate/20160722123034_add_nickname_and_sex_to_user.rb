class AddNicknameAndSexToUser < ActiveRecord::Migration
  def up
    add_column :users, :nickname,:string unless column_exists?(:users, :nickname)
    add_column :users, :sex,:string unless column_exists?(:users, :sex)

    User.reset_column_information
  end

  def down
    remove_column :users, :nickname if column_exists?(:users, :nickname)
    remove_column :users, :sex if column_exists?(:users, :sex)

    User.reset_column_information
  end
end
