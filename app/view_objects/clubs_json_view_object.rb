class ClubsJsonViewObject
  attr_reader :clubs

  def initialize(clubs)
    @clubs = clubs
  end

  def get_json
    {clubs: clubs.map{|club| get_club_json(club)}}
  end

  def get_club_json(club)
    {
      club_type: club.generic_club.club_type.capitalize,
      brand: club.generic_club.brand,
      male: club.generic_club.male ? 'M' : 'F',
      righty: club.generic_club.righty ? 'R' : 'L',
      head_feature: club.generic_club.head_feature.capitalize,
      shaft_stiffness: club.generic_club.shaft_stiffness.capitalize,
      condition: club.condition.capitalize,
      url: "/suppliers/#{club.supplier_id}/clubs/#{club.id}/listings/new",
      obj_class: club.class.to_s
    }
  end
end