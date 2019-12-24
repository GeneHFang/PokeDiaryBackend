class Pokemon < ApplicationRecord
    belongs_to :game

    url = 'https://pokeapi.co/api/v2/location-area/'

    def self.get_all_pokemon(locationID)
        # response = 


    end



end
