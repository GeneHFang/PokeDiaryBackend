class Api::V1::TrainerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :games
  end
  