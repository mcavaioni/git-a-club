class ClubSetsController < ApplicationController
  before_action :find_supplier, only: [:new, :create]

  def new
    @club_set = ClubSet.new
  end

  def create
    @club_set = ClubSet.new(club_set_params)
    @club_set.save
    render @club_set
  end

  def show

  end

  private

  def club_set_params
    params.require(:club_set).permit(:name, :summary, :picture, :club_ids => [])
  end

  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  
end
