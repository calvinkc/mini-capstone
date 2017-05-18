class OrdersController < ApplicationController

  # def new
  #   render "/products#"
  # end

  def create
    @product = 
    @price = params[:subtotal].to_f * params[:quantity].to_i
    @tax = @price 
    @grandtotal = @price + @tax


    order = Order.create(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id],
      subtotal: @price,
      tax: @tax,
      total: grandtotal
      )
    flash[:success] = "Order successfully created!"
    render "create.html.erb"
  end

end


#     t.integer  "user_id"
#     t.integer  "product_id"
#     t.integer  "quantity"
#     t.float    "subtotal"
#     t.float    "tax"
#     t.float    "total"