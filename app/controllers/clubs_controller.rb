class ClubsController < ApplicationController
  before_action :find_supplier
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


  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

end
