require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @service = DmvDataService.new
    @wa_ev_data = @service.wa_ev_registrations
  end

  describe '#create_vehicles' do
    it 'creates vehicle objects from the wa ev data' do
      vehicles = @factory.create_vehicles(@wa_ev_data)

      expect(vehicles).to be_an(array)
      expect(vehicles.first).to be_a(vehicle)
      expect(vehicles.first.engine).to eq(:ev)
      expect(vehicles.first.make).to eq('TOYOTA')
    end
  end 
end


