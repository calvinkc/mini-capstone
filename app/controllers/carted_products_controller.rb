class CartedProductsController < ApplicationController

  before_action :authenticate_user! 

  def index
    @carted_products = CartedProduct.all # Returns array of all carted products
    # Check nerdstore for a better of doing this!!
    render "index.html.erb" #All Item
  end

  def create
    @order = Order.find_by(user_id: current_user.id, completed: false) 
    if @order
      CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: @order.id
      )
     else 
      @order = Order.create(
      user_id: current_user.id,
      completed: false
      )

      # TODO: TAKE OUT CARTEDPRODUCT - D.R.Y since only different between if/else is order.id
      CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: @order.id
      )
    end
    flash[:success] = "Item successfully added!"
    redirect_to "/carted_products"
  end

end
