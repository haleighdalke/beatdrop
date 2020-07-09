class AddColumnToArtist < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :profile_link, :string
    add_column :artists, :image, :string

    add_column :genres, :image, :string
  end
end
