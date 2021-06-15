class VehiclesController < ApplicationController
  def index
    render json: Vehicle.search_by(params), include: :vehicle_model, status: 201

  end

  def create
    vehicle = Vehicle.new(vehicle_model_params)
    if vehicle.save
      render json: vehicle,
        include: :vehicle_model,
        except: [:vehicle_model_id, :created_at, :updated_at],
        status: 201
    else
      render json: { errors: vehicle.errors }, status: 422
    end
  end

  private

  def vehicle_model_params
    params.require(:vehicle).permit(
      :year,
      :model,
      :brand,
      :mileage,
      :price)
  end
end
