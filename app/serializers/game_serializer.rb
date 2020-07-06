class GameSerializer < ActiveModel::Serializer
  has_many :game_words
  has_many :words, through: :game_words
  attributes :id, :room_code
end
