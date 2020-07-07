class GamesController < ApplicationController

    def index
        @games = Game.all
        render json: @games
    end

    def create
        @game = Game.create(game_params)
        @words = Word.limit(25).order("RANDOM()")
        @words.each do |word|
            GameWord.create(game_id: @game.id, word_id: word.id, category: "test", guessed: false)
        end
        render json: @game
    end

    def code_lookup
      @game = Game.find_by(room_code: params[:room_code])

      render json: @game
    end

    private

    def game_params
        params.permit(:room_code, :id)
    end
end
