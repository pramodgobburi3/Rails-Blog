class PostCommentsController < ApplicationController
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

    def create
        @post = Post.find(params[:post_id])
        @post_comment = @post.post_comments.create(comment_params)
        @post_comment.user_id = @current_user.id

        @post_comment.save
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @post_comment = PostComment.find(params[:id])
        @post_comment.destroy
        redirect_to post_path(@post)
    end

    private def comment_params
        params.require(:post_comment).permit(:body)
    end
end
