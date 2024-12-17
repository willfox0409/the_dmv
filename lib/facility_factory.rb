class FacilityFactory
    def create_facilities(data, source)
        facilities = []

        case source
        when :co
            data.each do |entry|
                name = entry[:dmv_office]
                address = entry[:address_li]
                phone = entry[:phone]

                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone
                })
                facilities << facility
            end
            facilities
        end 
    end
end