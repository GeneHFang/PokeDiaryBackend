class Api::V1::GameSerializer
    include FastJsonapi::ObjectSerializer
    attributes :type_of_game, :trainer_id
  end
  