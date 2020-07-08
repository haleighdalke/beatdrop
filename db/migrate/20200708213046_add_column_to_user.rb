class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :string
    add_column :users, :country, :string
    add_column :users, :access_token, :string
    add_column :users, :refresh_token, :string
  end
end
