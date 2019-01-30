class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :set_current

    def current_user
        if session[:user_id]
            begin
                @current_user = User.find(session[:user_id])
            rescue ActiveRecord::RecordNotFound => e
                @current_user = nil
                session[:user_id] = nil
            end
        else
            @current_user = nil
            redirect_to login_path
        end
    end

    def set_current
        if session[:user_id]
            begin
                @current_user = User.find(session[:user_id])
            rescue ActiveRecord::RecordNotFound => e
                @current_user = nil
                session[:user_id] = nil
            end
        else
            @current_user = nil
        end
    end
end
