class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.build_supplier if @user.qualified_supplier?
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

  def update

    @user=User.find(params[:id])
    @user.update(user_params)

    @user.save
    # @user.build_supplier.save if !@user.supplier & @user.qualified_supplier?
    # redirect_to @user
    html_string = render_to_string 'users/show', locals: {user: @user}, layout: false
    # binding.pry
    render json: {template: html_string}
    # binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :phone_number, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
