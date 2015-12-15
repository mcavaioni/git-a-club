class ClubsController < ApplicationController
  before_action :find_supplier, except: [:index]
  before_action :find_club, only:[:destroy]

  def new
    @club = Club.new
  end

  def create
    binding.pry
    @club = @supplier.clubs.build(club_params)
    if @club.save
      render json: {success: "Club sucessfully created!"}
    else
      render json: {errors: "Error, club could not be created."}
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
    @club = Club.new
    @supplier = current_user.supplier
    new_club_form = render_to_string template: 'clubs/_new_form', locals: {club: @club, supplier: @supplier}, layout: false  
    # new_club_form = render_to_string template: 'clubs/_new_table_form', locals: {club: @club, supplier: @supplier}, layout: false  
    @clubs = current_user.supplier.clubs.where(active: true)
    render json: {table: ClubsJsonViewObject.new(@clubs).get_json, form: new_club_form}
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
