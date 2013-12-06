class Spot < ActiveRecord::Base

  ########################################
  # Associations
  ########################################
  belongs_to :place

end