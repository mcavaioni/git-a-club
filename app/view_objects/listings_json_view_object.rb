class ListingsJsonViewObject

  attr_reader :listings

  def initialize(listings)
    @listings=listings
  end

  def get_json_for_listing(listing)
    {id: listing.id,
    listable_type: listing.listable_type,
    start_date: listing.start_date,
    finish_date: listing.finish_date,
    url: "/listings/#{listing.id}",
    availability: listing.availability,
    price: listing.display_price,
    listable: {
      id: listing.listable.id,
      description: listing.listable.description
      }
    }
  end

  def collect_listings_json
    listings.collect do |listing|
      get_json_for_listing(listing)
    end
  end


end
