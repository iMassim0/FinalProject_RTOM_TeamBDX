class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
    set_product
    @order_item = OrderItem.new
    respond_to do |f|
      f.js { render :layout => false }
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

    def set_publish
      @product = Product.find(params[:id])
      @product.published = true
      if @product.save
        redirect_to products_path
      end
    end

    def set_unpublish
      @product = Product.find(params[:id])
      @product.published = false
      if @product.save
        redirect_to products_path
      end
    end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :price, :description, :size, :image, :published, :quotation)
    end
end
