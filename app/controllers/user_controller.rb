class UserController < ApplicationController
    before_action :authorize_request, except: :create

    def index
        user = User.all
        render json: user
    end
    
    
    def create
        user= User.new(user_params)
        if user.save
            render json: {message: "USER CREATED SUCCESSFULLY!", user: user}
        else
            render json: {message: "failure"}
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: {message: "USER UPDATED SUCCESSFULLY!", user: user}
        else
            render json: {message: "failure"}
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: {message: "USER DESTROYED SUCCESSFULLY!", user: user}
        else
            render json: {message: "failure"}
        end
    end

    private

    def user_params
        params.permit(:email, :password, :image)
    end
end
