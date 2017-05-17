class UsersController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create 
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully created account!"
      redirect_to "/"
    else 
      flash[:warning] = "Invalid entry!"
      redirect_to "/signup"
    end
  end

end
