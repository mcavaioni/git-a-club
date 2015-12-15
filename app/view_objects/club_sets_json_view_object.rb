class ClubSetsJsonViewObject
  attr_reader :club_sets

  def initialize(club_sets)
    @club_sets = club_sets
  end

  def get_json
    {club_sets: club_sets.map{|club_set| get_club_set_json(club_set)}}
  end

  def get_club_set_json(club_set)
    {
      description: club_set.description,
      url: "/suppliers/#{club_set.supplier.id}/clubs_sets/#{club_set.id}/listings/new",
      club_set_url: "/suppliers/#{club_set.supplier.id}/club_sets/#{club_set.id}",
      obj_class: club_set.class.to_s
    }
  end
end