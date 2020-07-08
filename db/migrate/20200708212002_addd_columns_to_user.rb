class AdddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :spotify_url, :string
    add_column :users, :href, :string
    add_column :users, :uri, :string
    add_column :users, :spotify_id, :integer
  end
end
