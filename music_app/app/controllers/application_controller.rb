class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :logged_in?, :current_user

    def login!(user)
        session[:session_token] = reset_session_token!
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end
end
