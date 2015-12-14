class ListingJsonViewObject
  attr_reader :listing

  def initialize(listing)
    @listing = listing
  end

  def get_json
    {reservations: listing.reservations.map{|reservation| get_reservation_json(reservation)}}
  end

  def get_reservation_json(reservation)
    {
      renter: reservation.renter.user.full_name,
      email: reservation.renter.user.email,
      phone: reservation.renter.user.phone_number,
      start_date: reservation.format_date(reservation.start_date),
      finish_date: reservation.format_date(reservation.finish_date),
      total: reservation.display_total_cost
    }
  end
end