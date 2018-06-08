class PagesController < ApplicationController

  def home
    @user = current_user
  end

  def shop

    respond_to do |f|
      f.js { render :layout => false }
    end
  end

  def characters
    respond_to do |f|
      f.js { render :layout => false }
    end
  end

  def trip
    respond_to do |f|
      f.js { render :layout => false }
    end
  end

end
