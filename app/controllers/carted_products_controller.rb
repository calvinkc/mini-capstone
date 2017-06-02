class CartedProductsController < ApplicationController

  before_action :authenticate_user! 

  def index
    #locate any open order for the current user
    @order = Order.find_by(user_id: current_user.id, completed: false)
    #if order has carted products.....
    if @order.carted_products.length > 0
    #then call up those products
      @carted_products = @order.carted_products 
      render "index.html.erb" 
    else
      flash[:warning] = "Your cart is empty!"
      redirect_to "/"
    end
  end

  def create
    @order = Order.find_by(user_id: current_user.id, completed: false) 
    #does this user already have an order open
    if @order 
      order_id = @order.id
    else 
    # no? okay then create new order then get id
      @order = Order.create(user_id: current_user.id, completed: false)
      order_id = @order.id
    end   
    
    new_product = CartedProduct.create(
    product_id: params[:product_id],
    quantity: params[:quantity],
    order_id: order_id
    )
    flash[:success] = "#{new_product.product.name} successfully added!"
    redirect_to "/carted_products"
  end

  def destroy
    carted_products = CartedProduct.find_by(id: params[:id])
    carted_product.destroy
    redirect_to "/carted_products"
  end

end
