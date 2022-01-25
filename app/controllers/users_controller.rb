class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
    def index
       @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render :new
      end
    end
  
    def edit
      @user= User.find(params[:id])
    end
  
    def destroy
      @us = User.find(params[:id])
      @us.destroy

      redirect_to admin_view_path

    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to current_user
      else
        render :edit
      end
    end


    private
      def user_params
        params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation)
      end
end
