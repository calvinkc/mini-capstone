class ProductsController < ApplicationController

  def index
    @items = Product.all
    render "index.html.erb" #All Item
  end

  def show
      recipe_id = params[:id]
      @item = Product.find_by(id: recipe_id)
    render "show.html.erb" #Individual Item
  end

  def new
    render "new.html.erb" #New Form
  end

  def create
    @new_item = Product.create(
      brand: params[:brand], 
      category: params[:category],
      price: params[:price],
      description: params[:description]
      )
    render "create.html.erb" #Create Success
  end

  def edit
    render "edit.html.erb"
  end
   
end
