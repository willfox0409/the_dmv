class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle) # refactor to be more concise, combine these conditional blocks?
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle 
   if vehicle.antique?
      vehicle.plate_type = :antique
   elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
   else
      vehicle.plate_type = :regular
   end

   if vehicle.plate_type == :ev
      @collected_fees += 200
   elsif vehicle.plate_type == :antique
      @collected_fees += 25
   else
      @collected_fees += 100
   end
  end
end
