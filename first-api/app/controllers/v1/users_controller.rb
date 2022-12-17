module V1 
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]
  
    def index
      @users = User.all
      render json: @users
    end
  
    def show 
      render json: @user
    end

    def login 
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
        render json: {
          message: 'login success'
        }, status: :ok
      else 
        render json: {
          message: 'invalid username or password'
        }, status: :unauthorized
      end
    end
   
    def register
      @user = User.new user_params
      @user.save!
      
      if @user.valid?
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def update 
      if @user.update(user_params) 
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
   
    def destroy
      @user.destroy
      render status: :no_content
    end
    
    private
   
    def set_user 
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:username, :full_name, :email,
                                   :password, :role)
    end
  end
end