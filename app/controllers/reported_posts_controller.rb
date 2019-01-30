class ReportedPostsController < ApplicationController
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

    def report        
        @post = Post.find(params[:id])
        if ReportedPost.where(post: @post, reported_user_id: @current_user.id).blank?
            @report = ReportedPost.new
            @report.post = @post
            @report.reported_user_id = @current_user.id
            @report.save
        end
        flash[:notice] = 'Thank you for your feedback.'
        redirect_to @post
    end
end
