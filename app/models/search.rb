class Search # < ActiveRecord::Base

  attr_accessor :search_params, :search_type, :generic_clubs

  # Add cool searches:
    # New Clubs
    # New Listings
    # Time.current.begining_of_month
    # Reservations in the past 30days?
    # Cheap stuff

    def initialize(search_type,search_params)
      @search_type = search_type
      @search_params = search_params
    end

    def get_results
      sanitize_search_params
      get_results_by_type
    end

    def get_results_by_type
      if search_type == 'club'
        generic_clubs = GenericClub.where(search_params)
        listable = Club.find_by_generic_clubs(generic_clubs)
      else
        listable = ClubSet.find_sets_where(search_params)
      end
      Listing.get_by_listable(listable)
    end

    def sanitize_search_params
      search_params.values.each do |value|
        value.delete("") if value.class == Array
      end
      search_params.delete_if {|attribute, value| value==[]}
    end

end
