class GameWordsController < ApplicationController
    def index
        @game_words = GameWord.all

        render json: @game_words
    end

    def update
        @game_word = GameWord.find(params[:id])
        @game_word.update(game_word_params)

        render json: @game_word
    end

    private

    def game_word_params
        params.permit(:guessed)
    end

end
