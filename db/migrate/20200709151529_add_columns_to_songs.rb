class AddColumnsToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :image, :string
    add_column :songs, :sound_link, :string
    add_column :songs, :video_link, :string
  end
end
