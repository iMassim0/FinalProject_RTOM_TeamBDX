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
    if !(@infos == nil)
      new_charge
      if @charge.save
        flash[:success] = "Paiement réussi"
        redirect_to new_order_path
      else
        flash[:error] = "Problème de paiement"
        redirect_to mon_panier_path
      end
  end

  def new_charge
    Stripe.api_key = "sk_test_qSh4KOVL09XngvBDrKBHQRRk"
    token = params.require(:stripeToken)
    @charge = Stripe::Charge.create({
      :amount => @order.total,
      :currency => "eur",
      :source => token,
      :description => "Charge for sophia.thompson@example.com"
    })
  end


end
