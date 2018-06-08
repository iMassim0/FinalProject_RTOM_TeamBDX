class UserController < ApplicationController

  def profile
    if current_user
      redirect_to profile_path
    else
      redirect_to new_user_session_path
    end
  end

end
