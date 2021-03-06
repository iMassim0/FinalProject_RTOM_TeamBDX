class CartsController < ApplicationController

  before_action :require_login, only: [:require, :payment]

  def show
    @order_items = current_order.order_items
    respond_to do |f|
      f.js { }
    end
  end

  def require
    @user = current_user
    @user.ordering
    respond_to do |f|
      f.js { }
    end
  end

  def payment
    @order = current_order
    @user = current_user
    @user.ordering
    if @user.update(params_user)
      respond_to do |f|
        f.js { }
      end
    else
      respond_to do |f|
        f.js { render :require }
      end
    end
  end

  def pay
    @order = current_order
    @user = current_user
    new_charge
    if @charge.save
      @order.products.each {|o| o.update(availability: 0)}
      @order.update(status: "payé")
      session[:order_id] = nil
      flash[:success] = "Paiement réussi"
      OrderMailer.with(user: @user, order: @order).order_to_customer.deliver_now
      OrderMailer.with(user: @user, order: @order).order_to_admin.deliver_now
      redirect_to root_path
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

  private

    def params_user
      params.require(:user).permit(:firstname, :lastname, :del_firstname, :del_lastname, :del_address, :del_zipcode, :del_town, :fac_firstname, :fac_lastname, :fac_address, :fac_zipcode, :fac_town, :phonenumber)
    end

end
