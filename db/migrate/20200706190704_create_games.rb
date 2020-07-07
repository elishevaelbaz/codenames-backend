class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :room_code
      t.string :turn
      t.integer :orange_words_left
      t.integer :purple_words_left

      t.timestamps
    end
  end
end
