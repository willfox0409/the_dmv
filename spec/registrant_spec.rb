require 'spec_helper'

RSpec.describe Registrant do 
    before(:each) do 
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end

    describe '#initialize' do 
        it 'exists' do 
            expect(@registrant_1).to be_a(Registrant)
        end

        it 'has a name' do 
            expect(@registrant_1.name).to eq("Bruce") 
        end

        it 'has an age' do 
            expect(@registrant_1.age).to eq(18)
        end

        it 'has a permit' do 
            expect(@registrant_1.permit?).to eq(true)
        end

        it 'defaults permit to false when not provided' do
            expect(@registrant_2.name).to eq("Penny")
            expect(@registrant_2.age).to eq(15)
            expect(@registrant_2.permit?).to eq(false)
        end

        it 'has license_data' do 
            expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
        end
    end
end