class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    @user.build_supplier if @user.qualified_supplier?
    # binding.pry
    @user.build_renter
    if @user.save #=> change to if when validation is added
      # @user.build_supplier.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.first_name.capitalize}"
      redirect_to @user
    else
      render :new
    end
  end

  def show

  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :phone_number, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
