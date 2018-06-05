class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id

    redirect_to shop_path
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update_attributes(order_item_params)
      @order_items = @order.order_items
      redirect_to root_path
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    redirect_to carts_path
  end


  def calcul_total
    @total = 0
    @order_items.added_items.each do |item|
      @total += ((item.price).round * @cart.cart_items.find_by(added_item: item).quantity.to_i)
    end
    return @total
  end

  private

    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity)
    end

    def order_params
      params.require(:order_item).permit(:status)
    end

end