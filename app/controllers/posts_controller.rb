class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def like 
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save

        redirect_to post_path(@post)
    end

    def create
        @post = Post.new(post_params)
        if @post.save
           redirect_to post_path(@post)
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

   

end
