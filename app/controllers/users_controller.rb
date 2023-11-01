require 'bcrypt'

class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(
        uid: params[:uid],
        password: params[:password],
        password_confirmation: params[:password_confirmation])
        if @user.save
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
