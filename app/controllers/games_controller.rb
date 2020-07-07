class GamesController < ApplicationController

    def index
        @games = Game.all
        render json: @games
    end

    def create
        @game = Game.create(game_params)
        @words = Word.limit(25).order("RANDOM()")
        categories = ["orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange", "purple", "purple", "purple", "purple", "purple", "purple", "purple", "purple", "bomb", "neutral", "neutral", "neutral", "neutral", "neutral", "neutral", "neutral"].shuffle
        @words.each_with_index do |word, index|
            GameWord.create(game_id: @game.id, word_id: word.id, category: categories[index], guessed: false)
        end
        render json: @game
    end

    def update
        @game = Game.find(params[:id])
        @game.update(game_params)

        render json: @game
    end

    def code_lookup
        @game = Game.find_by(room_code: params[:room_code])

        render json: @game
    end
    
    def new_round
        @game = Game.create(room_code: params[:room_code])
        @words = Word.limit(25).order("RANDOM()")
        categories = ["orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange", "purple", "purple", "purple", "purple", "purple", "purple", "purple", "purple", "bomb", "neutral", "neutral", "neutral", "neutral", "neutral", "neutral", "neutral"].shuffle
        @words.each_with_index do |word, index|
            GameWord.create(game_id: @game.id, word_id: word.id, category: categories[index], guessed: false)
        end
        render json: @game
    end

    def destroy
        @game = Game.find(params[:id])
        @game.destroy

        render plain: "game destroyed"
    end

    private

    def game_params
        params.permit(:room_code, :id, :orange_turn, :orange_words_left, :purple_words_left)
    end
end
