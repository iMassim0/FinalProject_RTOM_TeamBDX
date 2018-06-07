class UserController < ApplicationController

  def profile
    @user = current_user
    respond_to do |f|
      f.js { render :layout => false }
    end
  end

end
