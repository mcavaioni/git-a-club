class ClubSetsController < ApplicationController
  before_action :find_supplier, only: [:new, :create]

  def new
    @club_set = ClubSet.new
  end

  def create
    binding.pry
    
  end

  def show

  end

  private

  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  
end
