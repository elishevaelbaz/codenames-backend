class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :room_code
      t.boolean :orange_turn, :default => true
      t.integer :orange_words_left, :default => 9
      t.integer :purple_words_left, :default => 8

      t.timestamps
    end
  end
end
