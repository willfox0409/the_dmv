require 'spec_helper'

RSpec.describe VehicleFactory do 
    before(:each) do
        @factory = VehicleFactory.new
        @mock_data = [
            {
                vin_1_10: "3FMTK4SE2P",
                model_year: "2023",
                make: "FORD",
                model: "Mustang Mach-E"
            },
            {
                vin_1_10: "WBY8P8C51K",
                model_year: "2019",
                make: "BMW",
                model: "i3"
            }
        ]
    end

    describe 'create_vehicles' do 
      it 'creates an array of vehicles from the raw data' do 
            vehicles = @factory.create_vehicles(@mock_data)

            expect(vehicles).to be_an(Array)
            expect(vehicles.size).to eq(2)

            first_vehicle = vehicles.first
            expect(first_vehicle).to be_a(Vehicle)
            expect(first_vehicle.vin).to eq("3FMTK4SE2P")
            expect(first_vehicle.year).to eq("2023")
            expect(first_vehicle.make).to eq("FORD")
            expect(first_vehicle.model).to eq("Mustang Mach-E")
            expect(first_vehicle.engine).to eq(:ev)

            second_vehicle = vehicles.last
            expect(second_vehicle).to be_a(Vehicle)
            expect(second_vehicle.vin).to eq("WBY8P8C51K")
            expect(second_vehicle.year).to eq("2019")
            expect(second_vehicle.make).to eq("BMW")
            expect(second_vehicle.model).to eq("i3")
            expect(second_vehicle.engine).to eq(:ev)
        end
    end
end