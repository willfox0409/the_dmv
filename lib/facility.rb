class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  attr_accessor :collected_fees

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = []  
  end

  def add_service(service)
    @services << service
  end
end
