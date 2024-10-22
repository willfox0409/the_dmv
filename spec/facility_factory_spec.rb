require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do
    @factory = FacilityFactory.new
    @service = DmvDataService.new
    @co_dmv_data = @service.co_dmv_office_locations
  end

  describe '#create_facilities' do
    it 'creates facility objects from the co dmv data'do
      facilities = @factory.create_facilities(@co_dmv_data)

      expect(facilities).to be_an(Array)
      expect(facilities.first).to be_a(Facility)
      
      first_facility = facilities.first

      expect(first_facility.name).to eq("DMV Tremont Branch")
      expect(first_facility.address).to eq("2855 Tremont Place, Suite 118, Denver, CO 80205")
      expect(first_facility.phone).to eq("(720) 865-4600")
      expect(first_facility.services).to eq (["vehicle titles", "registration", "renewals", "VIN inspections"])
      expect(first_facility.hours).to eq (["Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m."])
      expect(first_facility.address_id).to eq("175164")
    end
  end
end