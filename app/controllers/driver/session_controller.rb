class Driver::SessionController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def new
    @driver = Driver.new
  end
  
  def create
    @driver = Driver.authenticate(params[:driver][:email], params[:driver][:password])
  
    if @driver
      session[:user_id] = @driver.id
      redirect_to root_url, :notice => "Logged in!"
    else
      @driver = Driver.new
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def delete
    session[:user_id] = nil
    
    redirect_to root_url, :notice => "Log out successfuly!"
  end
end
