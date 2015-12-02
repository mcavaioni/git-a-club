class User < ActiveRecord::Base
  has_many: provider_profiles
  has_many: renter_profiles
  
end
