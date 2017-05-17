class ImagesController < ApplicationController

  def new
    @product = Product.find_by(params[:id])
    render "new.html.erb"
  end

  def create
    id = params[:id]  #Product id from route
    image = Image.create(
      url: params[:url],
      product_id: id
      )
    flash[:success] = "Image successfully created!"
    redirect_to "/products/#{id}"
  end
end
