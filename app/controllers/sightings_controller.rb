class SightingsController < ApplicationController

    def index
        sightings = Sighting.all 
        render json: sightings, include: 
            [{:bird => {:only => [:name, :species]}}, 
            :location => {:only => [:latitude, :longitude]}], 
            except: [:updated_at]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting 
            render json: {
                id: sighting.id,
                bird: sighting.bird, #bird object
                location: sighting.location #location object
            }
        else   
            render json: {message: 'No sighting found with that id'}
    
        end

    end
end 
