class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  attr_accessor :collected_fees

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = details[:services] || []   
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil unless @services.include?('Vehicle Registration')

    vehicle.registration_date = Date.today

    if vehicle.year <= Date.today.year - 25
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
      @collected_fees += 200
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
    end

    @registered_vehicles << vehicle
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test') &&
                        registrant.permit? && registrant.age >= 16

    registrant.license_data[:written] = true
    true
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test') &&
                        registrant.license_data[:written]

    registrant.license_data[:license] = true
    true
  end

  def renew_drivers_license(registrant)
    return false unless @services.include?('Renew License') &&
                        registrant.license_data[:license]

    registrant.license_data[:renewed] = true
    true
  end
end
