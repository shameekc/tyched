class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
  def new
    @title = 'Sign up'
    @user = User.new
  end
  
  def destroy
     User.find(params[:id]).destroy
     flash[:success] = "User deleted."
     redirect_to users_path
   end
  
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end  
  
  def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] =  "Welcome. You are now ready to get Tyched !"
        redirect_to @user
      else
        @title = "Sign up"
        render 'new'
      end
    end
    
    def edit
      #@user = User.find(params[:id])
      @title = "Edit user"
    end
    
    def update
       # @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
          flash[:success] = "Profile updated."
          redirect_to @user
        else
          @title = "Edit user"
          render 'edit'
        end
      end
  
private

def authenticate
      deny_access unless signed_in?
end

def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end


  
end
