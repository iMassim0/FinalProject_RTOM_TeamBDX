class PagesController < ApplicationController
<<<<<<< HEAD

  def shop
    @products = Product.all
    @order_item = current_order.order_items.new
  end

=======
  def home
  end
>>>>>>> 68a9431ab2e505983d6207c89dea63c50cd9d1e5
end
