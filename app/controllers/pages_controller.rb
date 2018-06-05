class PagesController < ApplicationController
  def home
  end
  
  def shop
    @products = Product.all
    @order_item = current_order.order_items.new
  end

end
