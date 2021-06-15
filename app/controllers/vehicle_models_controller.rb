class VehicleModelsController < ApplicationController
  def create
    vehicle_model = VehicleModel.new(vehicle_model_params)
    if vehicle_model.save
      render json: vehicle_model,
        include: :vehicle_brand,
        except: [:vehicle_brand_id],
        status: 201
    else
      render json: { errors: vehicle_model.errors }, status: 422
    end
  end

  private

  def vehicle_model_params
    params.require(:vehicle_model).permit(
      :brand,
      :name)
  end
end
