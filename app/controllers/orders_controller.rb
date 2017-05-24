class OrdersController < ApplicationController

  before_action :authenticate_user!
  
  # def new
  #   render "/products#"
  # end

  def show
    @order = Order.find_by(id: params[:id]) 
  end

  def create
    product_id = params[:product_id]
    product = Product.find_by(id: product_id)
    calculated_subtotal = product.price.to_i * quantity
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
      completed: false
      )
    flash[:success] = "Order successfully created!"
    redirect_to "/orders/#{order.id}"
  end

  def update
     order_id = params[:order_id]
     calculated_subtotal = 0
     cart = CartedProduct.where(order_id: order_id)
     cart.each do |item|
       calculated_subtotal += item.product.price
     end
     calculated_subtotal = cart.sum("price")
     calculated_tax = calculated_subtotal * 0.09
     calculated_total = calculated_tax + calculated_subtotal

     order = Order.find(order_id)
     order.update(
     subtotal: calculated_subtotal,
     tax: calculated_tax,
     total: calculated_total,
     completed: true
     )

     flash[:info] = "Product Updated!"
     redirect_to "/orders/#{order_id}"

  end 
end


