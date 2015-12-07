class Search # < ActiveRecord::Base

  attr_accessor :search_params, :search_type

  # Add cool searches:
    # New Clubs
    # New Listings
    # Time.current.begining_of_month
    # Reservations in the past 30days?

    # def self.for(word_part)
    #   Word.where("NAME LIKE '%#{word_part}%'")
    # end

    def initialize(search_type,search_params)
      @search_type = search_type
      @search_params = search_params
    end

    def get_results
      sanitize_search_params
      GenericClub.where(search_params)
    end

    # @search_params={"male"=>"true", "righty"=>"true", "club_type"=>["driver", "putter", ""], "head_feature"=>[""], "shaft_stiffness"=>["senior", ""]}
    def sanitize_search_params
      search_params.values.each do |value|
        value.delete("") if value.class == Array
      end
      search_params.delete_if {|attribute, value| value==[]}
    end

    # def results
    #   Word.where("NAME LIKE '%#{word_part}%'")
    # end

    private


end
