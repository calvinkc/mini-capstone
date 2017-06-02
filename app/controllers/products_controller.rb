class ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    @items = Product.all
    @database = Product.count 

    # Session Counting only 
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1
    @visits = session[:count]

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

    if params[:category]
      @products = Category.find_by(title: params[:category]).products
    end
    render "index.html.erb" #All Item
  end

  def show
    @item = Product.find_by(id: params[:id])
    if params[:id] == "random"
      @item = Product.all.sample
    end
      render "show.html.erb" #Individual Item
  end

  def new
 
  end

  def create
      @new_item = Product.new(
      brand: params[:brand], 
      price: params[:price],
      supplier: params[:supplier]["supplier_id"],
      description: params[:description]
      )
    if @new_item.save 
      flash[:success] = "Product Created"
      redirect_to "/products/#{@new_item.id}"
    else
      render :new
    end
  end

  def edit
    @item = Product.find_by(id: params[:id]) 
    render "edit.html.erb"
  end

  def update
      @item = Product.find_by(id: params[:id])
      @item.update(
        brand: params[:brand], 
        category: params[:category],
        price: params[:price],
        description: params[:description]
        )
      flash[:info] = "Product Updated!"
      redirect_to "/products/#{@item.id}"
      #render "update.html.erb"
  end

  def destroy
    item = Product.find_by(id: params[:id])
    item.destroy
    flash[:danger] = "Product Deleted!"
    redirect_to "/"
  end

  def search
    search_term = params[:search]
    @item = Product.where("brand LIKE ? OR category LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render "index.html.erb"
  end
   
end
