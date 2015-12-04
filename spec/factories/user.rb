FactoryGirl.define do
  factory :user do
    first_name "Avi"
    last_name "Turkewitz"
    email "test@flatiron.com"
    password_digest "abc123"
  end
end
