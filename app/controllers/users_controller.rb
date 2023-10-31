require 'bcrypt'

class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        signup_id = params[:uid]
        signup_password = BCrypt::Password.create(params[:pass])
        user = User.new(uid: signup_id, pass: signup_password)
        if user.save
            redirect_to users_path
        else
            render 'new'
        end
    end
    
    def destroy
        delete_user = User.find(params[:id])
        delete_user.destroy
        redirect_to users_path
    end
end
