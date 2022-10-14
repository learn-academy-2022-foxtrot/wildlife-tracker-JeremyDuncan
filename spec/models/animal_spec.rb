require 'rails_helper'

# Can see validation errors if an animal doesn't include a common name and scientific binomial
RSpec.describe Animal, type: :model do  
    it 'is not valid without a common_name' do
    test = Animal.create scientific_binomial: 'Naja Naja'
    expect(test.errors[:common_name]).to_not be_empty
  end

  it 'is not valid without a scientific_binomial' do
    test = Animal.create common_name: 'Indian Cobra'
    expect(test.errors[:scientific_binomial]).to_not be_empty
  end

# Can see a validation error if an animal's common name exactly matches the scientific binomial
it 'is not valid if common_name and scientific_binomial are the same' do
  test = Animal.create common_name: 'Indian Cobra', scientific_binomial: 'Indian Cobra'
  expect(test.errors[:common_name]).to_not be_empty
end

# Can see a validation error if the animal's common name and scientific binomial are not unique
it 'is not valid if common_name is not unique' do
  test = Animal.create common_name: 'Indian Cobra', scientific_binomial: 'Naja Naja'

  test2 = Animal.create common_name: 'Indian Cobra', scientific_binomial: 'test Naja'
  expect(test2.errors[:common_name]).to_not be_empty
end

it 'is not valid if scientific_binomial is not unique' do
  test = Animal.create common_name: 'Indian snake', scientific_binomial: 'Naja Naja'

  test2 = Animal.create common_name: 'Indian Cobra', scientific_binomial: 'Naja Naja'
  expect(test2.errors[:scientific_binomial]).to_not be_empty
end

end









# Can see a status code of 422 when a post request can not be completed because of validation errors