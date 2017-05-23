class OrdersController < ApplicationController

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
end


