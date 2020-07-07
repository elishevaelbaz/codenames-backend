class GameWordSerializer < ActiveModel::Serializer
  belongs_to :game
  belongs_to :word
  attributes :id, :game_id, :word_id, :category, :guessed, :name

  def name
    self.object.word.name
  end
end
