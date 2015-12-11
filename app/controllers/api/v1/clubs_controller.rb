class Api::V1::ClubsController < ApplicationController

  def index
    @clubs = Club.all
    render json: @clubs
  end

end
