module Validable

  module StartDate
    def valid_start_date
      if self.start_date && self.finish_date && self.start_date > self.finish_date
        errors.add(:status, "start date cannot be after finish date")
      end
    end

    # def valid_finish_date
    # if self.finish_date < self.start_date
    #     errors.add(:status, "finish date cannot be before start date")
    #   end
    # end
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

    def required_wedges
      default_wedge = self.clubs.generic_club.club_type
      binding.pry
      wedges_array = ["lob_wedge", "gap_wedge", "sand_wedge", "pitching_wedge"]
      wedge_intersection = default_wedge & wedges_array
      if !wedge_intersection.empty?
        errors.add(:clubSet, "a set must have a wedge")
      end
    end

    def required_clubs
      default_clubs = self.clubs.generic_club.club_type
      clubs_array = ["driver", "putter", "5_iron_or_hybrid", "6_iron", "7_iron", "8_iron", "9_iron"]
      club_intersection = default_clubs && clubs_array
      if club_intersection != clubs_array
        errors.add(:clubSet, "A set must have a driver, putter and 5 - 9 irons")
      end
    end

    # def all_required_clubs
    #   !required_wedges && !required_clubs
    # end

  end

end
