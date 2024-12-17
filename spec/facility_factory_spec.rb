require 'spec_helper'

RSpec.describe FacilityFactory do 
    before(:each) do 
        @facility_factory = FacilityFactory.new
        @co_source = :co
        @ny_source = :ny

        @co_mock_data = [
            {
                dmv_office: "DMV Southwest Branch",
                address_li: "3100 S. Sheridan Blvd.",
                phone: "(720) 865-4600"
            },
            {
                dmv_office: "DMV Southeast Branch", 
                address_li: "2243 S Monaco Street Pkwy",
                phone: "(720) 865-4600"
            }
        ]

        @ny_mock_data = [
            {
                office_name: "LAKE PLACID",
                street_address_line_1: "2693 MAIN STREET",
                public_phone_number: "5188283350"
            },
            {
                office_name: "HUDSON",
                street_address_line_1: "560 WARREN STREET",
                public_phone_number: "5188283350"
            }
        ]
    end

    describe 'create_facilities' do 
        it 'creates an array of facilities from Colorado data' do 
            facilities = @facility_factory.create_facilities(@co_mock_data, @co_source)

            expect(facilities).to be_an(Array)
            expect(facilities.size).to eq(2)

            first_facility = facilities.first
            expect(first_facility).to be_a(Facility)
            expect(first_facility.name).to eq("DMV Southwest Branch")
            expect(first_facility.address).to eq("3100 S. Sheridan Blvd.")
            expect(first_facility.phone).to eq("(720) 865-4600")

            second_facility = facilities.last
            expect(second_facility).to be_a(Facility)
            expect(second_facility.name).to eq("DMV Southeast Branch")
            expect(second_facility.address).to eq("2243 S Monaco Street Pkwy")
            expect(second_facility.phone).to eq("(720) 865-4600")
        end

        it 'creates facilities from New York data' do 
            facilities = @facility_factory.create_facilities(@ny_mock_data, @ny_source)

            expect(facilities).to be_an(Array)
            expect(facilities.size).to eq(2)

            first_facility = facilities.first
            expect(first_facility).to be_a(Facility)
            expect(first_facility.name).to eq("LAKE PLACID")
            expect(first_facility.address).to eq("2693 MAIN STREET")
            expect(first_facility.phone).to eq("5188283350")

            second_facility = facilities.last
            expect(second_facility).to be_a(Facility)
            expect(second_facility.name).to eq("HUDSON")
            expect(second_facility.address).to eq("560 WARREN STREET")
            expect(second_facility.phone).to eq("5188283350")
        end
    end
end