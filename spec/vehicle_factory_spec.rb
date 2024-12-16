require 'spec_helper'

RSpec.describe VehicleFactory do 
    before(:each) do
        @factory = VehicleFactory.new
        @mock_data = [
            {
                vin_1_10: "3FMTK4SE2P"
                model_year: "2023"
                make: "FORD"
                model: "Mustang Mach-E"
            },
            {
                vin_1_10: "WBY8P8C51K"
                model_year: "2019"
                make: "BMW"
                model: "i3"
            }
        ]
    end

    describe 'create_vehicles' do 
      it 'creates an array of vehicles from the raw data' do 
      end
    end
end