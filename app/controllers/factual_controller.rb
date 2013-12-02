class FactualController < ApplicationController
  def search
    latitude = params['latitude']
    longitude = params['longitude']
    page = params['page'] || 1
    diameter = 750
    @factual = FactualApi.new
    @factual.getPlacesNear(search: 'restaurant', latitude: latitude, longitude: longitude, page: page, diameter: diameter)

    respond_to do |format|
      format.json { render json: @factual.rows }
    end
  end
end
