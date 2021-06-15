require 'rails_helper'

RSpec.describe VehicleModel, type: :model do
  describe '#name' do
    it 'when there is null returns the error' do 
      vm = VehicleModel.create({brand: 'VW'})
      expect(vm.errors[:name].first).to eq "can't be blank"
    end
    it 'when there is too short returns the error' do 
      vm = VehicleModel.create({brand: 'VW', name: "  "})
      expect(vm.errors[:name].first).to eq "can't be blank"
    end

    it 'when there is valid save record' do 
      vm = VehicleModel.create({brand: 'VW', name: 'Golf'})
      expect(vm).to be_valid
      expect(VehicleModel.find_by(name: 'golf')).to eq(vm)
    end
    
    it 'do not accept duplicated names' do 
      vm = VehicleModel.create({brand: 'VV', name: 'Golf'})
      vm_duplicate = VehicleModel.create({brand: 'VV', name: 'Golf'})
      expect(vm).to be_valid
      expect(vm_duplicate.errors[:name].first).to eq 'has already been taken'
    end
  end

  describe '#brand' do
    it 'when there is null returns the error' do 
      vm = VehicleModel.create({name: 'Golf'})
      expect(vm.errors[:brand].first).to eq "can't be blank"
    end
    
    it 'when there is too short returns the error' do 
      vm = VehicleModel.create({brand: '  ', name: 'Golf'})
      expect(vm.errors[:brand].first).to eq "can't be blank"
    end

    context 'when vehicle_brand exist' do
      it 'should be find record' do
        VehicleBrand.create(name: 'VW')
        vm = VehicleModel.create({brand: 'VW', name: 'Golf'})
        expect(VehicleBrand.find_by(name: 'vw')).to eq(vm.vehicle_brand)
      end
    end

    context 'when vehicle_brand does not exist' do
      it 'should be find record' do
        vm = VehicleModel.create({brand: 'VW', name: 'Golf'})
        expect(vm).to be_valid
        expect(VehicleBrand.find_by(name: 'vm')).to eq(vm.vehicle_brand)
      end
    end
  end
end
