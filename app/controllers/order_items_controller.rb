class OrderItemsController < ApplicationController

  before_action :set_order, only: [:create, :update, :destroy]

  def create
    @order_items = current_order.order_items
    @order_item = @order.order_items.new(order_item_params)
    @order.user = current_user
    @order.save
    session[:order_id] = @order.id
    @order_items = @order.order_items
    respond_to do |f|
      f.js { }
    end
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update_attributes(order_item_params)
      @order_items = @order.order_items
      redirect_to root_path
    end
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    @order.update(subtotal: @order.subtotal)
    respond_to do |f|
      f.js { }
    end
  end

  private

    def set_order
      @order = current_order
    end

    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity)
    end

    def order_params
      params.require(:order_item).permit(:status)
    end

end
