class VehicleModel < ApplicationRecord
  belongs_to :vehicle_brand, dependent: :destroy
  has_many   :vehicles

  attr_accessor :brand

  validates :brand, presence: true, length: { minimum: 1 }
  validates :name, presence: true, uniqueness: true, length: { minimum: 1 }

  before_validation :set_brand
  before_save { self.name.downcase!}

  private

  def set_brand
    return nil if self.brand.nil?
    self.brand.downcase!
    brand = VehicleBrand.find_or_create_by(name: self.brand)
    self.vehicle_brand_id = brand.id
  end
end
