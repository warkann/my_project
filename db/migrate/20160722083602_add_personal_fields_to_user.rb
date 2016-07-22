class AddPersonalFieldsToUser < ActiveRecord::Migration
  def up
    add_column :users, :city, :string unless column_exists?(:users, :city)
    add_column :users, :height, :string unless column_exists?(:users, :height)
    add_column :users, :boobs_size, :string unless column_exists?(:users, :boobs_size)
    add_column :users, :body_type,:string unless column_exists?(:users, :body_type)
    add_column :users, :age,:string unless column_exists?(:users, :age)
    add_column :users, :phone,:string unless column_exists?(:users, :phone)
    add_column :users, :area,:string unless column_exists?(:users, :area)
    add_column :users, :interests,:string unless column_exists?(:users, :interests)

    User.reset_column_information
  end

  def down
    remove_column :users, :city if column_exists?(:users, :city)
    remove_column :users, :height if column_exists?(:users, :height)
    remove_column :users, :boobs_size if column_exists?(:users, :boobs_size)
    remove_column :users, :body_type if column_exists?(:users, :body_type)
    remove_column :users, :age if column_exists?(:users, :age)
    remove_column :users, :phone if column_exists?(:users, :phone)
    remove_column :users, :area if column_exists?(:users, :area)
    remove_column :users, :interests if column_exists?(:users, :interests)

    User.reset_column_information
  end
end
