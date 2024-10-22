require './lib/facility'

class FacilityFactory
  def create_facilities(data)
    data.map do |entry|

    Facility.new(
      name: entry[:dmv_office] || entry[:office_name],
      address: format_address(entry),
      phone: entry[:phone] || entry[:public_phone_number] || "Phone not available",
      services: entry[:services_p] || "No services listed",
      hours: format_hours(entry),
      address_id: entry[:address_id] || entry[:unique_id] || "ID not available"
    )
    end
  end
    
  def format_address(entry)
      if entry[:address_li]
        "#{entry[:address_li]}, #{entry[:address__1]}, #{entry[:city]}, #{entry[:state]} #{entry[:zip]}"
        else
          "#{entry[:street_address_line_1]}, #{entry[:city]}, #{entry[:state]} #{entry[:zip_code]}"
        end
      end
    
      def format_hours(entry)
        if entry[:monday_beginning_hours]
          "Mon: #{entry[:monday_beginning_hours]} - #{entry[:monday_ending_hours]}"
        else
          entry[:hours] || "Hours not available"
        end
    end
end       
        
        
             
