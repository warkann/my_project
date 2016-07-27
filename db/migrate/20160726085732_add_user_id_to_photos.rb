class AddUserIdToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :user_id, :integer unless column_exists?(:photos, :user_id)

    Photo.reset_column_information
  end

  def down
    remove_column :photos, :user_id if column_exists?(:photos, :user_id)

    Photo.reset_column_information
  end
end
