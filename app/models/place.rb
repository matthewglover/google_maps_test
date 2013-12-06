class Place < ActiveRecord::Base
  ########################################
  # Associations
  ########################################
  has_many :spots
  accepts_nested_attributes_for :spots

  ########################################
  # Validations
  ########################################
  validates :name, presence: true
  validates :lng, presence: true, if: :lat?
  validates :lat, presence: true, if: :lng?
  validates :address, presence: true, unless: :location?
  validates :factual_id, uniqueness: true, allow_nil: true

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
