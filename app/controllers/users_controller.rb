class UsersController < ApplicationController
  def new
    @title = 'Sign up'
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def index
    @users = User.all
  end  
  
  def create
      @user = User.new(params[:user])
      if @user.save
        flash[:success] = "Welcome. You are now ready to get Tyched !"
        redirect_to @user
      else
        @title = "Sign up"
        render 'new'
      end
    end
  
end
