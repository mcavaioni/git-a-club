class ListingsHeatMapServiceObject

  def self.build_hash
    Listing.all.each_with_object({}) do |listing, listing_hash|
      add_dates_to_hash(listing, listing_hash)
    end
  end

  def self.add_dates_to_hash(listing, listing_hash)
    listing.listing_range.each do |date|
      listing_hash[date] ||= 0
      listing_hash[date] += 1
    end
  end

end
