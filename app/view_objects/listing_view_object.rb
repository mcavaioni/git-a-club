class ListingViewObject

  attr_reader :listing

  def initialize(listing)
    @listing = listing
  end

  def description
    if listing.listable_type == 'Club'
      get_club_description
    else
      get_club_set_description
    end
  end

  def get_club_description
    generic_club=listing.listable.generic_club
    "#{generic_club.brand} #{generic_club.club_type}"
  end

  def get_club_set_description
    club_set = listing.listable
    club_count = club_set.clubs.length
    "#{club_set.name} - #{club_count} clubs"
  end

end
