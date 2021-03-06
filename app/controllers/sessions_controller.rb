class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end
    
    def destroy
        if session[:user_id] != nil
        session.delete :user_id
        end
    end
    
end
