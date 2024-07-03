# app/controllers/users_controller.rb
class UsersController < ApplicationController
    
    before_action :find_user_by_name, except: %i[create new index]

    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find(params[:id])
      render json: @user
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  
    private
  
    def find_user_by_name
        @user = User.find_by(name: params[:id])
        if @user
            render json: @user
        else
            render json: { error: 'User not found' }, status: :not_found
        end
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
  