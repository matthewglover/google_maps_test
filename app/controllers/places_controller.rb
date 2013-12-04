class PlacesController < ApplicationController
  respond_to :json

  def index
    respond_with Place.all
  end

  def show
    respond_with Place.find(params[:id])
  end

  def create
    respond_with Place.create(place_params)
  end

  def update
    respond_with Place.update(place_params)
  end

  def destroy
    respond_with Place.destroy(params[:id])
  end

  private

    def place_params
      params.require(
        :name
      ).permit(
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
