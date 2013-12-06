class SpotsController < ApplicationController
  respond_to :json

  def create
    # spot = Spot.build(spot_params)
    # respond_with(Spot.save)
  end

  def destroy
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