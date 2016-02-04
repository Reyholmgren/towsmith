FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    first_name 'John'
    last_name 'Doe'
    phone '555-5555'
    roles 'user'
    password 'password'
  end
end