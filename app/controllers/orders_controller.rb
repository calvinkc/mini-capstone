class OrdersController < ApplicationController

  before_action :authenticate_user!
  
  def show
    @order = Order.find_by(id: params[:id]) 
  end

  def create
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    product = Product.find_by(id: product_id)
    calculated_subtotal = product.price.to_i * quantity
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.create(
      user_id: current_user.id,
      product_id: product_id,
      quantity: quantity,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
      )
    flash[:success] = "Order successfully created!"
    redirect_to "/orders/#{order.id}"
  end

  def update
   #pull order from DB
   order = Order.find_by(id: params[:id])
   #mark order as complete
   order.completed = true 
   #initialize subtotal
   calculated_subtotal = 0
   #loop: find price for each item in cart, multi. by qt, then add them together.
   order.carted_products.each do |item|
     calculated_subtotal += item.product.price * item.quantity
   end
   calculated_tax = calculated_subtotal * 0.09
   # update the order
   order.subtotal = calculated_subtotal
   order.tax = calculated_tax
   order.total = calculated_subtotal + calculated_tax
   order.save

   # order = Order.find(order_id)
   # order.update(
   # subtotal: calculated_subtotal,
   # tax: calculated_tax,
   # total: calculated_total,
   # completed: true
   # )    This is just another way to update that order

   redirect_to "/orders/#{order_id}"
  end 

end


