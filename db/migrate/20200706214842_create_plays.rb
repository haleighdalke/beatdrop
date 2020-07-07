class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.integer :num_plays
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end
end
