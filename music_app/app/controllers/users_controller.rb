class UsersController < ApplicationController 
    def show
        @user = User.find(params[:id])
        render :show
    end
    
    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user.id)
            # login(@user)
        else
            fail
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end