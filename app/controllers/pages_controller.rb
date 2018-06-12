class PagesController < ApplicationController

  def landing
  end

  def home
    @user = current_user
  end

  def shop
    @user = current_user
    @products = Product.all
    @order_item = OrderItem.new
    @current_order = current_order
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
