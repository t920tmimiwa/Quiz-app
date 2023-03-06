class ApplicationController < ActionController::Base
private
    def current_user
        if session[:uname]
            User.find_by(uname: session[:uname])
        end
    end
    helper_method :current_user
end
