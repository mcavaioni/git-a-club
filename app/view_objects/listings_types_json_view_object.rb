class ListingsTypesJsonViewObject
  attr_reader :listings

  def initialize(listings)
    @listings = listings
  end

  def get_json
    listings.map{|listing| single_listing_json(listing)}
  end

  def single_listing_json(listing)
    {
      description: listing.listable.description,
      type: listing.listable_type,
      price: listing.display_price,
      start_date: listing.format_date(listing.start_date),
      finish_date: listing.format_date(listing.finish_date),
      url: "/listings/#{listing.id}/details"
    }
  end
end