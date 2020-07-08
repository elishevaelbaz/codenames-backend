class Game < ApplicationRecord
  has_many :game_words, dependent: :destroy
  has_many :words, through: :game_words
end
