class ClubsController < ApplicationController

  def new
    binding.pry
    @club = Club.new
  end
end
