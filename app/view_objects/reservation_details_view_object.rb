class ReservationDetailsViewObject
  attr_reader :reservation

  def initialize(reservation)
    @reservation = reservation
  end

  def get_json
    {
      description: reservation.listing.listable.description,
      type: reservation.listing.listable_type,
      price: reservation.display_total_cost,
      start_date: reservation.format_date(reservation.start_date),
      finish_date: reservation.format_date(reservation.finish_date),
      url: "/renters/#{reservation.renter_id}/reservations/#{reservation.id}",
      supplier: reservation.listing.listable.supplier.user.full_name,
      address: reservation.listing.listable.supplier.user.address
    }
  end
end