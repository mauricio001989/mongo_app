module V1
  class UsersController < ApplicationController
    before_action :user_find, only: [:show]
  
    def create
      @user = User.new(user_params)
      
      return render json: @user, status: :created if @user.save

      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end

    def index
      render json: User.paginate(pagy_headers_merge)
    end

    def show
      render json: @user_find
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_find
      @user_find ||= User.find(params[:id])
    end
  end
end
