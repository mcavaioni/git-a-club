FactoryGirl.define do
  factory :club do
    supplier_id 1
    generic_club_id 1
    active true
    condition "good"
  end
end
