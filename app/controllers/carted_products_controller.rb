class CartedProductsController < ApplicationController
  
  def create
    # product_id = params[:product_id]
    # quantity = params[:quantity].to_i
    # product = Product.find_by(id: product_id)
    # calculated_subtotal = product.price.to_i * quantity
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_subtotal + calculated_tax

    @order = Order.find_by(user_id: current_user.id, completed: false) 

    if @order
      CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: @order.id
      )
     else 
      @order = Order.create(
      # quantity: params[:quantity],
      user_id: current_user.id,
      # product_id: params[:product_id],
      # subtotal: calculated_subtotal,
      # tax: calculated_tax,
      # total: calculated_total,
      completed: false
      )
      CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: @order.id
      )
    flash[:success] = "Item successfully added!"
    redirect_to "/cart/#{order.id}"
    end
  end

end
