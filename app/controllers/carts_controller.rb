class CartsController < ApplicationController


  def show
    @order_items = current_order.order_items
  end

  def require
    @user = current_user
  end

  def payment
    @order = current_order
    @user = current_user
    @infos = params[:user]
  end

  def pay
    @order = current_order
    new_charge
    if @charge.save
      @products = current_order.products
      @products.each {|o| o.availability = 0}
      @products.each {|o| o.save}
      session[:order_id] = nil
      flash[:success] = "Paiement réussi"
      redirect_to shop_path
    else
      flash[:error] = "Problème de paiement"
      redirect_to payment_path
    end
  end

  def new_charge
    Stripe.api_key = "sk_test_qSh4KOVL09XngvBDrKBHQRRk"
    token = params.require(:stripeToken)
    @charge = Stripe::Charge.create({
      :amount => @order.total.to_i * 100,
      :currency => "eur",
      :source => token,
      :description => "Charge #{current_user.firstname} #{current_user.lastname} - Order #{@order.id}"
    })
  end


end
