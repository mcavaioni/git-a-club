class ClubsController < ApplicationController
  before_action :find_supplier
  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save #=> change to if when validation is added
      @club.build_supplier.save
      flash.now[:notice] = "Club sucessfully created"
      redirect_to @supplier.user
    else
      render :new
      flash.now[:notice] = "Error, club not created"
    end
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
