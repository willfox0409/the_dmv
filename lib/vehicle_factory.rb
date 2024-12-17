class VehicleFactory
    def create_vehicles(data)
        vehicles = []
        data.each do |entry|
            vin = entry[:vin_1_10]
            year = entry[:model_year]
            make = entry[:make]
            model = entry[:model]

            vehicle = Vehicle.new({
              vin: vin, 
              year: year,
              make: make, 
              model: model, 
              engine: :ev
            })
            vehicles << vehicle 
        end
        vehicles 
    end
end

