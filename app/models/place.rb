class Place < ActiveRecord::Base
  ########################################
  # Associations
  ########################################


  ########################################
  # Validations
  ########################################
  validates :name, presence: true
  validates :lng, presence: true, if: :lat?
  validates :lat, presence: true, if: :lng?
  validates :address, presence: true, unless: :location?

  ########################################
  # Private methods
  ########################################
  private

  def lat?
    !lat.nil?
  end

  def lng?
    !lng.nil?
  end

  def location?
    lat? && lng?
  end
end
