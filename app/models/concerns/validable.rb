module Validable
  module StartDate
    def valid_start_date
      if self.start_date && self.finish_date && self.start_date > self.finish_date
        errors.add(:status, "start date cannot be after finish date")
      end
    end
  end
end