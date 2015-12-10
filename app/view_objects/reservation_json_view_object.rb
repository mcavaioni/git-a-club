class ReservationJsonViewObject
  attr_reader :reservation

  def initialize(reservation)
    @reservation = reservation
  end

  def get_json_for_reservation()
    {:notice => reservation.errors.full_messages,
                  :form_data => {:cost => reservation.display_total_cost,
                                :start => reservation.format_date(reservation.start_date),
                                :end => reservation.format_date(reservation.finish_date),
                                :reservation_data => {:start_date => reservation.start_date,
                                                      :finish_date => reservation.finish_date,
                                                      :listing_id => reservation.listing_id
                                                      }
                                }
    }
  end
end