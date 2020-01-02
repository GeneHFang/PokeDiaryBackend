class Api::V1::PokemonSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :species, :img, :game_id
  end
  