FactoryGirl.define do
  factory :type do
    typeofbook Faker::Book.publisher
  end
end
