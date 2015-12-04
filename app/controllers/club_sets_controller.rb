class ClubSetsController < ApplicationController
  before_action :find_supplier, only: [:new, :create, :show, :destroy]
  before_action :find_club_set, only: [:show, :destroy]

  def new
    @club_set = ClubSet.new
  end

  def create
    @club_set = ClubSet.new(club_set_params)
    @club_set.save
    redirect_to supplier_club_set_path(@supplier, @club_set)
  end

  def show

  end

  def destroy
    @club_set.active = false
    @club_set.save
    flash.now[:notice] = "Your club set has been removed."
    redirect_to @supplier
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
