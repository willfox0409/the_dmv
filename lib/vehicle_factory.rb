 require './lib/vehicle'
 
 class VehicleFactory   
    def create_vehicles(data)
        data.map do |entry|
            Vehicle.new(
                vin: entry[:vin_1_10], 
                year: entry[:model_year],
                make: entry[:make],
                model: entry[:model],
                engine: :ev
            )
        end
    end
 end
