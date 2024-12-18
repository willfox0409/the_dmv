require 'spec_helper'

RSpec.describe FacilityFactory do 
    before(:each) do 
        @facility_factory = FacilityFactory.new
        @co_source = :co
        @ny_source = :ny
        @mo_source = :mo

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

        @mo_mock_data = [
            {
                name: "Harrisonville",
                address1: "2009 Plaza Dr.",
                city: "Harrisonville",
                state: "MO",
                zipcode: "64701",
                phone: "(816) 884-4133"
                },
                {
                name: "High Ridge",
                address1: "1684 Old Gravois RD",
                city: "High Ridge",
                state: "MO",
                zipcode: "63049",
                phone: "(636) 677-3339"
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

        it 'creates facilities from Missouri data' do 
            facilities = @facility_factory.create_facilities(@mo_mock_data, @mo_source)

            expect(facilities.size).to eq(2)

            first_facility = facilities.first
            expect(first_facility).to be_a(Facility)
            expect(first_facility.name).to eq("Harrisonville")
            expect(first_facility.address).to eq("2009 Plaza Dr., Harrisonville, MO 64701")
            expect(first_facility.phone).to eq("(816) 884-4133")
          
            second_facility = facilities.last
            expect(second_facility).to be_a(Facility)
            expect(second_facility.name).to eq("High Ridge")
            expect(second_facility.address).to eq("1684 Old Gravois RD, High Ridge, MO 63049")
            expect(second_facility.phone).to eq("(636) 677-3339")
        end

        it 'returns an empty array when given an invalid source' do
            facilities = @facility_factory.create_facilities(@co_mock_data, :invalid_source)
            expect(facilities).to eq([])
        end

        it 'handles data with missing keys' do
            incomplete_data = [
                { dmv_office: "DMV Southwest Branch", phone: "(720) 865-4600" }, 
                { address_li: "3100 S. Sheridan Blvd.", phone: "(720) 865-4600" } 
            ]
          
            facilities = @facility_factory.create_facilities(incomplete_data, @co_source)
          
            expect(facilities.size).to eq(2)
          
            first_facility = facilities.first
            expect(first_facility.name).to eq("DMV Southwest Branch")
            expect(first_facility.address).to eq(nil)
            expect(first_facility.phone).to eq("(720) 865-4600")
          
            second_facility = facilities.last
            expect(second_facility.name).to eq(nil)
            expect(second_facility.address).to eq("3100 S. Sheridan Blvd.")
            expect(second_facility.phone).to eq("(720) 865-4600")
        end
    end
end

