class UserController < ApplicationController

  def profile
    if current_user
      @user_orders = Order.where(user_id: session[:user_id])
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

end
