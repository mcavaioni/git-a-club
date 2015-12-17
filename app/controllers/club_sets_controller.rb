class ClubSetsController < ApplicationController
  before_action :find_supplier, only: [:new, :create, :show, :destroy]
  before_action :find_club_set, only: [:show, :destroy]

  def index
    @club_set = ClubSet.new
    @supplier = current_user.supplier
    new_club_set_form = render_to_string template: 'club_sets/_new_form', locals: {club_set: @club_set, supplier: @supplier}, layout: false
    # new_club_form = render_to_string template: 'clubs/_new_table_form', locals: {club: @club, supplier: @supplier}, layout: false
    @club_sets = current_user.supplier.club_sets.select{|club_set| club_set.active}
    render json: {table: ClubSetsJsonViewObject.new(@club_sets).get_json, form: new_club_set_form}
  end

  def new
    @club_set = ClubSet.new
  end

  def create
    # @club_set = ClubSet.new(club_set_params)
    # if @club_set.save
    #   redirect_to supplier_club_set_path(@supplier, @club_set)
    # else
    #   render 'club_sets/new'
    # end

    @club_set = ClubSet.new(club_set_params)
    if @club_set.save
      index
    else
      render json: {errors: @club_set.errors.full_messages}
    end
  end

  def show

  end

  def destroy
    @club_set.active = false
    @club_set.save
    flash.now[:notice] = "Your club set has been removed."
    # redirect_to @supplier
    render json: {errors: @club_set.errors.messages[:status]}
  end

  private

  def club_set_params
    params.require(:club_set).permit(:name, :summary, :picture, :club_ids => [])
  end

  def find_club_set
    @club_set = ClubSet.find(params[:id])
  end

  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end


end
