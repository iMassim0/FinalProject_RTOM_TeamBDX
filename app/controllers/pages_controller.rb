class PagesController < ApplicationController

  def home
    @user = current_user
  end

  def shop
    @products = Product.all
    @order_item = current_order.order_items.new
    respond_to do |f|
      f.js { }
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
