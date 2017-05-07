class ProductsController < ApplicationController

  def index
    @items = Product.all
    render "index.html.erb"
  end

  def show
      recipe_id = params[:id]
      @item = Product.find_by(id: recipe_id)
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end


  def create
    @new_item = Product.create(
      brand: params[:brand], 
      category: params[:category],
      price: params[:price],
      description: params[:description]
      )
    render "create.html.erb"
  end
   
end
