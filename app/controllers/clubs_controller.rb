class ClubsController < ApplicationController
  before_action :find_supplier, except: [:index]
  before_action :find_club, only:[:destroy]

  def new
    @club = Club.new
  end

  def create
    @club = @supplier.clubs.build(club_params)
    if @club.save #=> change to if when validation is added
      flash.now[:notice] = "Club sucessfully created"
      redirect_to @supplier
    else
      render :new
      flash.now[:notice] = "Error, club not created"
    end
  end

  def destroy
    @club.active = false
    @club.save
    # REPLACE WITH .club_attributes METHOD
    flash.now[:notice] = "Your club has been removed."
    redirect_to @supplier
  end

  def index
    @clubs = current_user.supplier.clubs.where(active: true)
    render json: ClubsJsonViewObject.new(@clubs).get_json
  end

private

  def club_params
    params.require(:club).permit(:condition, :generic_club_attributes => [:club_type, :brand, :male, :righty, :head_feature, :shaft_stiffness])
    # department_params.permitted? => true
  end

  def find_club
    @club=Club.find(params[:id])
  end

  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

end
