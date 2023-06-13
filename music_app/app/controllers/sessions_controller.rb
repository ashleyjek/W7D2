class SessionsController < ApplicationController 

    def new
        render :new
    end

    def create
        email = [:user][:email]
        password = [:user][:password]
        @user = User.find_by_credentials(email, password)
        if @user
            login!(@user)
            redirect_to user_url(@user.id)
        else
           render :new
        end
        
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end