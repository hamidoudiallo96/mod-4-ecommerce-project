class UsersController < ApplicationController

    def index 
        users = User.all 
        render json: users 
    end

    def show
        user = User.find(params[:id])
        render json: user
    end 

    def create
        user = User.create(user_params)
        
        if user.valid?
            render json: {token: token(user.id), user_id: user.id}
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end 
    end  

    private

    def user_params
        params.permit(:username, :password)
    end 

end
