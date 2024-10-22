require './lib/facility'

class FacilityFactory
  def create_facilities(data)
    data.map do |entry|
      Facility.new(
        name: entry[:dmv_office],
        address: format_address(entry),
        phone: entry[:phone],
        services: entry[:services_p],
        hours: format_hours(entry[:hours]),
        address_id: entry[:address_id]
      )
    end
  end

  def format_address(entry)
    "#{entry[:address_li]}, #{entry[:address__1]}, #{entry[:city]}, #{entry[:state]} #{entry[:zip]}"
  end

  def format_services(service_string)
    service_string || ""
  end

  def format_hours(hours_string)
    if hours_string
      hours_string
    else
      "Hours not available"
    end
  end
end
