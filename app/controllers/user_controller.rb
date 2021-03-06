class UserController < ApplicationController

  before_action :require_admin, only: [:index, :orders]

  def profile
    if current_user
      @user_orders = Order.where(user_id: session[:user_id])
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def index
    @users = User.all
  end

  def orders
    @users = User.all
    @orders = Order.all
  end

  def set_admin
    @user = User.find(params[:id])
    @user.is_admin = true
    if @user.save
      redirect_to admin_users_path
    end
  end

  def unset_admin
    @user = User.find(params[:id])
    @user.is_admin = false
    if @user.save
      redirect_to admin_users_path
    end
  end



end
