class Api::V1::SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
    render json: @suppliers
  end

  def show
    @supplier = Supplier.find(params[:id])
    render json: @supplier
  end

end
