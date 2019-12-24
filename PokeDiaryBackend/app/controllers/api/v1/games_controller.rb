class Api::V1::GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]

    def index
        games = Game.all
        render json: Api::V1::GameSerializer.new(games)
    end

    def create
        game = Game.find_or_create_by(game_params)

        if game.valid?
            render json: Api::V1::GameSerializer.new(game)
        else
            render json: game.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: Api::V1::GameSerializer.new(@game)
    end

    def update
        @game = Game.assign_attributes(game_params)

        if @game.save
            render json: Api::V1::GameSerializer.new(@game)
        else 
            render json: @game.errors, status: :unprocessable_entity
        end
    end

    def destroy
        game = @game.destroy

        render json: Api::V1::GameSerializer.new(game)
    end

    private

    def set_game
        @game = Game.find params[:id]
    end

    def game_params
        params.require(:game).permit(:name)
    end

end