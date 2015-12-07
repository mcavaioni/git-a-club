module Validable

  module StartDate
    def valid_start_date
      if self.start_date && self.finish_date && self.start_date > self.finish_date
        errors.add(:status, "start date cannot be after finish date")
      end
    end
  end

  module ClubSetValidations
    def all_same_hand
      default_hand = self.clubs.first.generic_club.righty
      if self.clubs.any? {|club| club.generic_club.righty != default_hand}
        errors.add(:clubs, "all clubs must be righty or lefty, you cannot mix and match")
      end
    end

    def all_same_gender
      default_gender = self.clubs.first.generic_club.male
      if self.clubs.any? {|club| club.generic_club.male != default_gender}
        errors.add(:clubs, "all clubs must be for the same gender, you cannot mix and match")
      end
    end
  end

end
