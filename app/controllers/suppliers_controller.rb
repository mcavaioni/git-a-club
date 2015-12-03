class SuppliersController < ApplicationController
  before_action :find_supplier
  def show
    @clubs = @supplier.clubs
  end

  private
  def find_supplier
    @supplier = Supplier.find(params[:id])
  end
end
