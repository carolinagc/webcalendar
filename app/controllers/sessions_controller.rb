class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.where(email: params[:session][:email].downcase)
#    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      redirect_to user_path(user)
    else
      flash[:error] = 'Invalid email/passowrd combination'
      render 'new'      
    end 
 end

  def destroy
    sign_out
    redirect_to root_url

  end
end
