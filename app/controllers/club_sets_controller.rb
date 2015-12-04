class ClubSetsController < ApplicationController
  before_action :find_supplier, only: [:new, :create, :show]

  def new
    @club_set = ClubSet.new
  end

  def create
    @club_set = ClubSet.new(club_set_params)
    @club_set.save
    redirect_to supplier_club_set_path(@supplier, @club_set)
  end

  def show
    @club_set = ClubSet.find(params[:id])
  end

  def destroy
    @club_set.active = false
  end

  private

  def club_set_params
    params.require(:club_set).permit(:name, :summary, :picture, :club_ids => [])
  end

  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  
end
