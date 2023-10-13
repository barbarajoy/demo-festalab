class AddPhotoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :photo, :has_one_attached
  end
end
