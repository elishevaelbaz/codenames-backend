class GameWordsController < ApplicationController
    def index
        @game_words = GameWord.all

        render json: @game_words
    end

    def update
        @game_word = GameWord.find(params[:id])
        @game_word.update(game_word_params)

        game_room = Game.find(@game_word.game_id)
        body = {game: game_room, game_word: @game_word}
        GameRoomChannel.broadcast_to(game_room[:room_code], body)
        
        render json: @game_word
    end

    private

    def game_word_params
        params.permit(:guessed)
    end

end
