class Search # < ActiveRecord::Base

  attr_reader :search_query

  # Add cool searches:
    # New Clubs
    # New Listings
    # Time.current.begining_of_month
    # Reservations in the past 30days?

    # def self.for(word_part)
    #   Word.where("NAME LIKE '%#{word_part}%'")
    # end

    def initialize(search_query)
      @search_query = search_query
    end

    def search_as_array
      search_query.delete(",")split(" ")
    end

    # def results
    #   Word.where("NAME LIKE '%#{word_part}%'")
    # end



end
