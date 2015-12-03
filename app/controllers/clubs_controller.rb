class ClubsController < ApplicationController
  before_action :find_user
  def new
    @club = Club.new
  end

  def create
    binding.pry
  end

private

  def club_params
    params.require(:club).permit(:condition, :generic_club_attributes => [:type, :brand, :male, :righty])
    # department_params.permitted? => true
  end


  def find_user
    @user = User.find(params[:user_id])
  end

end
