class SessionsController < ApplicationController
  
    def create
        name = params[:user][:name]
        @current_user = User.where(:name=> name)
        if @current_user.length==0 then
        redirect_to login_path
        else
        @current_user[0][:id]
        session[:user]=@current_user[0][:name]
        redirect_to movies_path
    end
    end

    def login_attempt
        authorized_user = RegisteredUser.authenticate(params[:name_or_email],params[:login_password])
            if authorized_user
              session[:user_id] = authorized_user.id
              flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.name}"
              redirect_to(:action => 'index', :controller => "users")
            else
              flash[:notice] = "Invalid Username or Password"
              flash[:color]= "invalid"
              render "login"    
            end   
        end
end
