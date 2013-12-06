class Spot < ActiveRecord::Base

  ########################################
  # Associations
  ########################################
  belongs_to :place, autosave: true
  accepts_nested_attributes_for :place

  ########################################
  # Validations
  ########################################
  validates :place, presence: true

  def autosave_associated_records_for_place
    if new_place = Place.find_by(factual_id: place.factual_id)
      self.place = new_place
    else
      self.place.save!
    end
  end
end