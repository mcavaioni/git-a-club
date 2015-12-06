class SuppliersController < ApplicationController
  before_action :find_supplier, only: [:show]
  def show
    @clubs = @supplier.clubs
    @club_sets = @supplier.club_sets.uniq
  end

  def new
    @user = User.find(current_user.id)
  end

  private
  def find_supplier
    @supplier = Supplier.find(params[:id])
  end
end
