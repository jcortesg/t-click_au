class Vehicle < ApplicationRecord
  belongs_to :vehicle_model

  attr_accessor :brand
  attr_accessor :model
  validates :brand, presence: true, length: { minimum: 1 }
  validates :model, presence: true, length: { minimum: 1 }
  validates :year,
    presence: true,
    inclusion: { in: 1900..Date.today.year },
    format: { 
      with: /(19|20)\d{2}/i,
      message: 'should be a four-digit year'
    }
  
  validates :price,
    presence: true,
    numericality: { greater_than: 0 }

  validates :mileage,
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  
  before_validation :set_model
 
  scope :by_model, ->(model_name) { joins(:vehicle_model).where("vehicle_models.name LIKE ?", "%#{model_name}%")}
  scope :mileage_lower_than, ->(num) { where("mileage <= ?", num) }
  scope :price_lower_than, ->(num) { where("price <= ?", num) }
  scope :year_greather_than, ->(num) { where("year >= ?", num) }

  def self.search_by(params)
    vehicles = Vehicle.all
    vehicles = vehicles.by_model(params[:model_name]) if params[:model_name]
    vehicles = vehicles.mileage_lower_than(params[:mileage]) if params[:mileage]
    vehicles = vehicles.price_lower_than(params[:price]) if params[:price]
    vehicles = vehicles.year_greather_than(params[:year]) if params[:year]
    vehicles
  end

  private

  def set_model
    return if self.model.nil? 
    self.model.downcase!
    model = VehicleModel.find_by(name: self.model)
    return if model.nil?
    self.vehicle_model_id = model.id
  end
end
