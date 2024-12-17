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
        when :ny
            data.each do |entry|
                name = entry[:office_name]
                address = entry[:street_address_line_1]
                phone = entry[:public_phone_number]

                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone
                })
                facilities << facility
            end
        end 
        facilities
    end
end