class ReservationsJsonViewObject
  attr_reader :reservations

  def initialize(reservations)
    @reservations = reservations
  end

  def get_json 
    reservations.map{|reservation| single_reservation_json(reservation)}
  end

  def single_reservation_json(reservation)
    {
      description: reservation.listing.listable.description,
      type: reservation.listing.listable_type,
      price: reservation.display_total_cost,
      start_date: reservation.format_date(reservation.start_date),
      finish_date: reservation.format_date(reservation.finish_date),
      url: "/renters/#{reservation.renter_id}/reservations/#{reservation.id}"
    }
  end
end