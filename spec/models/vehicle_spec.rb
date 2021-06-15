require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  before do
    @data = {
      brand: "VW",
      model: "Golf",
      year: "2020",
      price: 100000,
      mileage: 30000
    }

    VehicleModel.create!({name: "Golf", brand: "VW"}) 
  end

  describe '#brand' do
    it 'when there is null returns the error' do
      @data[:brand] = ""
      vm = Vehicle.create(@data)
      expect(vm.errors[:brand].first).to eq "can't be blank"
    end

  end

  describe '#model' do
    it 'when there is null returns the error' do 
      @data[:model] = ""
      vm = Vehicle.create(@data)
      expect(vm.errors[:model].first).to eq "can't be blank"
    end
  end
  describe '#year' do
    it 'when there is null returns the error' do 
      @data[:year] = ""
      vm = Vehicle.create(@data)
      expect(vm.errors[:year].first).to eq "can't be blank"
    end
    it 'should be returns the error when is not valid format' do 
      @data[:year] = 'ochenta'
      vm = Vehicle.create(@data)
      expect(vm.errors[:year].first).to eq 'is not included in the list'
    end
  end
  describe '#price' do
    it 'when there is null returns the error' do 
      @data[:price] = ""
      vm = Vehicle.create(@data)
      expect(vm.errors[:price].first).to eq "can't be blank"
    end
    it 'should be returns the error when is not valid format' do 
      @data[:price] = -1
      vm = Vehicle.create(@data)
      expect(vm.errors[:price].first).to eq 'must be greater than 0'
    end
  end

  context "With valid info" do
    it 'should be save new record' do
      vehicle = Vehicle.create(@data)
      expect(vehicle).to be_valid
    end
  end
end
