class AddPhotoToFeaturedUser < ActiveRecord::Migration[5.0]
  def change
    add_column :featured_users, :photo, :string
  end
end
