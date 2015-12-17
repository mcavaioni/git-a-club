class ClubSetJsonViewObject
  attr_reader :club_set

  def initialize(club_set)
    @club_set = club_set
  end

  def get_json
    {
      name: club_set.name,
      summary: club_set.summary,
      description: club_set.description,
      url: "/suppliers/#{club_set.supplier.id}/club_sets/#{club_set.id}/listings/new",
      club_set_url: "/suppliers/#{club_set.supplier.id}/club_sets/#{club_set.id}",
      obj_class: club_set.class.to_s,
      club_set: ClubsJsonViewObject.new(club_set.clubs).get_json
    }
  end
end