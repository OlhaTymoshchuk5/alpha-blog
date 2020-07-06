class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        #memolization. If we have already referenced current user and we have the current user object available, 
        #so we can just return it and not quiring the db
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
         #use !! to return into a boolean 
      !!current_user
    end

    def require_user
      if !logged_in?
        flash[:alert] = "You must be logged in to perform that action"
        redirect_to login_path
      end
    end
end
