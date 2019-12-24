class Api::V1::PokemonsController < ApplicationController
    before_action :set_pokemon, only: [:show, :update, :destroy]

    def index
        pokemons = Pokemon.all
        render json: Api::V1::PokemonSerializer.new(pokemons)
    end

    def create
        pokemon = Pokemon.find_or_create_by(pokemon_params)

        if pokemon.valid?
            render json: Api::V1::PokemonSerializer.new(pokemon)
        else
            render json: pokemon.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: Api::V1::PokemonSerializer.new(@pokemon)
    end

    def update
        @pokemon = Pokemon.assign_attributes(pokemon_params)

        if @pokemon.save
            render json: Api::V1::PokemonSerializer.new(@pokemon)
        else 
            render json: @pokemon.errors, status: :unprocessable_entity
        end
    end

    def destroy
        pokemon = @pokemon.destroy

        render json: Api::V1::PokemonSerializer.new(pokemon)
    end

    private

    def set_pokemon
        @pokemon = Pokemon.find params[:id]
    end

    def pokemon_params
        params.require(:pokemon).permit(:name, :game_id, :species)
    end

end