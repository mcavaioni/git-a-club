FactoryGirl.define do
  factory :listing do
    start_date Date.new(2015, 12, 1)
    finish_date Date.new(2015, 12, 10)
    price 15
  end
end
