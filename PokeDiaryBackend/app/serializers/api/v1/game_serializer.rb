class Api::V1::GameSerializer
    include FastJsonapi::ObjectSerializer
    attributes :type_of_game, :trainer_id, :version, :created_at, :updated_at, :pokemons
  end
  