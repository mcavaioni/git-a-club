class SuppliersController < ApplicationController
  before_action :find_supplier
  def show
    binding.pry
    @clubs = @supplier.clubs
    @club_sets = @supplier.club_sets
  end

  private
  def find_supplier
    @supplier = Supplier.find(params[:id])
  end
end
