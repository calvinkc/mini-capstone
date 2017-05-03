class ProductsController < ApplicationController

  def shopping_method
      @item = Product.last
    render "shopping.html.erb"
  end

  def shopping_all
    @items = Product.all
    render "all.html.erb"
  end
end
