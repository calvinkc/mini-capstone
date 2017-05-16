class ProductsController < ApplicationController

  belongs_to :supplier

  def index
    @items = Product.all
    @database = Product.count 

    # Providing Sort Ability here
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    if sort_attribute
      @items = Product.all.order(sort_attribute)
      if sort_order
      @items = Product.all.order(sort_attribute => sort_order)
      end
    end
    # End Sort Here

    # Begin Discounted Items
    sort_discount = params[:discount]
    if sort_discount
      @items = Product.where("price < ?", 1000)
    end
    # end discount items

    render "index.html.erb" #All Item
  end

  def show
    @item = Product.find_by(id: params[:id])
    if params[:id] == "random"
      product = Product.all
      @item = product.sample
    end
      render "show.html.erb" #Individual Item
  end

  def new
    render "new.html.erb" #New Form
  end

  def create
    new_item = Product.create(
      brand: params[:brand], 
      category: params[:category],
      price: params[:price],
      description: params[:description]
      )
      flash[:success] = "Product Created!"
      redirect_to "/products/#{new_item.id}"
    # render "create.html.erb" #Create Success
  end

  def edit
    @item = Product.find(params[:id]) #single hash
    render "edit.html.erb"
  end

  def update
      item = Product.find(params[:id])
      item.update(
        brand: params[:brand], 
        category: params[:category],
        price: params[:price],
        description: params[:description]
        )
      flash[:info] = "Product Updated!"
      redirect_to "/products/#{item.id}"
      #render "update.html.erb"
  end

  def destroy
    item = Product.find(params[:id]) #single hash
    item.destroy
    flash[:danger] = "Product Deleted!"
    redirect_to "/"
    #render "destroy.html.erb"
  end

  def search
    search_term = params[:search]
    @item = Product.where("brand LIKE ? OR category LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render "index.html.erb"
  end
   
end
