require 'spec_helper'

RSpec.describe FacilityFactory do 
    before(:each) do 
        @facility_factory = FacilityFactory.new
        @source = :co
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
    end

    describe 'create_facilities' do 
      it 'creates an array of facilities from the raw colorado data' do 
            facilities = @facility_factory.create_facilities(@co_mock_data, @source)

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
    end
end