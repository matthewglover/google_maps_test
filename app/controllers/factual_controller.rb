class FactualController < ApplicationController
  def search
    lat = params['lat']
    lng = params['lng']
    page = params['page'] || 1
    radius = params['radius'] || 500
    @factual = FactualApi.new
    @factual.search(
      search: 'restaurant',
      lat: lat,
      lng: lng,
      page: page,
      radius: radius
    )

    respond_to do |format|
      format.json { render json: @factual.rows }
    end
  end
end
