class DeleteImageFromSongs < ActiveRecord::Migration[6.0]
  def change
    remove_column :songs, :image
  end
end
