class PlacesController < ApplicationController
  respond_to :json

  def index
    respond_with(Place.all)
  end

  def show
    respond_with(Place.find(params[:id]))
  end

  def create
    place = Place.find_or_initialize_by(factual_id: place_params[:factual_id]) do |p|
      p.name = place_params[:name]
      p.telephone = place_params[:telephone]
      p.address = place_params[:address]
      p.postcode = place_params[:postcode]
      p.region = place_params[:region]
      p.country = place_params[:country]
      p.lat = place_params[:lat]
      p.lng = place_params[:lng]
      place_params[:spots_attributes].each do |s|
        p.spots.build(s)
      end
    end
    place.save
    respond_with(place)
  end

  def update
    respond_with(Place.update(place_params))
  end

  def destroy
    respond_with(Place.destroy(params[:id]))
  end

  private

    def place_params
      params.require(
        :place
      ).permit(
        :name,
        :factual_id,
        :telephone,
        :address,
        :postcode,
        :region,
        :country,
        :lat,
        :lng,
        spots_attributes: [:keywords]
      )
    end
end
