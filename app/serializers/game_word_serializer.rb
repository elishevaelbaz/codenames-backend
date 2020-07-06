class GameWordSerializer < ActiveModel::Serializer
  belongs_to :game
  belongs_to :word
  attributes :id
end
