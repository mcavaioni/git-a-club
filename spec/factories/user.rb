FactoryGirl.define do
  factory :user do
    first_name 'Joe'
    last_name 'Smith'
    address '123 Main St'
    email 'test@example.com'
    phone_number '123-456-7890'
    password_digest 'password'
  end
end