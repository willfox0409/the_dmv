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

  def register_vehicle(vehicle) 
    if @services.include?('Vehicle Registration') 

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

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.age >= 16 && registrant.permit?
      registrant.license_data[:written] = true 
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end
