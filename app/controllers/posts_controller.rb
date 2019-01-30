class PostsController < ApplicationController
    before_action :current_user
    @error_messages = ""
    @info_messages = nil
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
    def index
        if(session[:user_id] == nil)
            redirect_to login_path
        else
            @current_user = User.find(session[:user_id])
            @posts = Post.all
        end
    end

    def show
        @post = Post.find(params[:id])
    
    end

    def new
        @post = Post.new
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        @post.user_id = @current_user.id

        if(@post.save)
            redirect_to @post
        else
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
        if(@post.user_id != @current_user.id)
            redirect_to posts_path
        end
    end

    def update
        @post = Post.find(params[:id])

        if(@post.update(post_params))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
