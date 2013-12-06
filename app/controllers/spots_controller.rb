class SpotsController < ApplicationController
  respond_to :json

  def index
    spots = Spot.all_with_place
    respond_with(spots, methods: :place)
  end

  def show
    respond_with(Spot.find(params[:id]))
  end

  def create
    respond_with(Spot.create(spot_params))
  end

  def update
    respond_with(Spot.update(spot_params))
  end

  def destroy
    respond_with(Spot.destroy(params[:id]))
  end

  ########################################
  # Private methods
  ########################################
  private

  def spot_params
    params.require(
      :spot
    ).permit(
      :keywords,
      place_attributes: [
        :id,
        :name,
        :factual_id,
        :telephone,
        :address,
        :postcode,
        :region,
        :country,
        :lat,
        :lng
      ]
    )
  end
end