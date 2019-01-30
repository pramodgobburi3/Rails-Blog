class PagesController < ApplicationController
    before_action :current_user

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
    def about
        @title = 'About Us'
        @body = 'The content of the about us page goes here'
    end
end
