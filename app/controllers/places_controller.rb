class PlacesController < ApplicationController
  respond_to :json

  def index
    respond_with(Place.all)
  end

  def show
    respond_with(Place.find(params[:id]))
  end

  def create
    place = Place.new(place_params)
    if place.save
      respond_with place
    else
      respond_with({ errors: place.errors.full_messages })
    end
  end

  def update
    respond_with(Place.update(place_params))
  end

  def destroy
    respond_with(Place.destroy(params[:id]))
  end

  private

    def place_params
      params.permit(
        :name,
        :factual_id,
        :telephone,
        :address,
        :postcode,
        :region,
        :country,
        :lat,
        :lng
      )
    end
end
