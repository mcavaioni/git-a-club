class GenericClubViewObject

  def initialize(generic_club)
    @generic_club=generic_club
  end

  def gender
    @generic_club.male ? "Men's" : "Women's"
  end

  def handed
    @generic_club.righty ? "Righty" : "Lefty"
  end

  def gender_handed
    "#{gender} #{handed}"
  end

end
