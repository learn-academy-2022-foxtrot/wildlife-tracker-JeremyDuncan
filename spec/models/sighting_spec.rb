require 'rails_helper'

RSpec.describe Sighting, type: :model do
    # Can see validation errors if a sighting doesn't include latitude, longitude, or a date
    it 'is not valid without a latitude' do
      test = Sighting.create longitude: '22', date:"2022-10-15"
      expect(test.errors[:latitude]).to_not be_empty
    end
  
    it 'is not valid without a longitude' do
      test = Sighting.create latitude: '14', date:"2022-10-15"
      expect(test.errors[:longitude]).to_not be_empty
    end
  
    it 'is not valid without a date' do
      test = Sighting.create latitude: "14", longitude: '22'
      expect(test.errors[:date]).to_not be_empty
    end
end
