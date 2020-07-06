class WordSerializer < ActiveModel::Serializer
  has_many :game_words
  has_many :games, through: :game_words
  attributes :id, :name
end
