require 'poke-api-v2'
class Pokemon < ApplicationRecord
    belongs_to :game


    #not sure if this is how to hold data
    @@locations = {}

    # url = 'https://pokeapi.co/api/v2/location-area/'


    #Getting Tentacool
        #locationID == 1 
        #Pokemon.get_all_pokemon_by_location(locationID).first.pokemon
            #keys 
            #   @name
            #chain into pokemon
            #   .get (actual pokemon entry)
                #keys
                #   @sprites images
    def self.get_all_pokemon_by_location(locationID)
        unless @@locations[locationID]
            @@locations << PokeApi.get(location_area: locationID).pokemon_encounters
        end
        
        @@locations[locationID]

    end



end
