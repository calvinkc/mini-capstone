class ProductsController < ApplicationController

  def index
    @items = Product.all
    # @database = Product.count 
    render "index.html.erb" #All Item
  end

  def show
      product_id = params[:id]
      @item = Product.find_by(id: product_id)
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
    @item = Product.find(params[:id]) #single hash
    render "edit.html.erb"
  end

  def update
      @item = Product.find(params[:id])
      @item.update(
        brand: params[:brand], 
        category: params[:category],
        price: params[:price],
        description: params[:description]
        )
      render "update.html.erb"
  end

  def destroy
    item = Product.find(params[:id]) #single hash
    item.destroy
    render "destroy.html.erb"
  end
   
end
