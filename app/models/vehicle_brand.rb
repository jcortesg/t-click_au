class VehicleBrand < ApplicationRecord
  has_many :vehicle_models, dependent: :destroy
  
  validates :name,
    presence: true,
    uniqueness: true

  before_save { self.name.downcase!}
end
