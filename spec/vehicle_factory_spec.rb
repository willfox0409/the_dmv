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

      expect(vehicles).to be_an(Array)
      expect(vehicles.first).to be_a(Vehicle)
      expect(vehicles.first.engine).to eq(:ev)

      makes = vehicles.map(&:make)
      expect(makes).to include('TOYOTA')
    end
  end 
end


