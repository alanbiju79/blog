class PostsController < ApplicationController
    before_action :authenticate_account!, except: [:index, :show ]
    before_action :set_post, only: [:show]
    before_action :auth_subscriber, only: [:new]

    def index
        @posts = Post.all
    end

    def show
        @comment = Comment.new
    end

    def new
        @publication = Publication.find(params[:publication_id])
        @post = Post.new
    end

    def create
        @post = Post.new post_values
        @post.account_id = current_account.id
        @post.publication_id = params[:publication_id]
        

        if @post.save
            redirect_to publications_path(@post.publication_id)
        else
            @publication = Publication.find(params[:publication_id])
            render :new
        end

    end
    

    private

    def set_post
        @post = Post.includes(:comments).find(params[:id])
    end

    def auth_subscriber
        unless Subscription.where(publication_id: params[:publication_id], account_id: current_account.id).any?
            redirect_to root_path, flash: { danger: "Not Authorised" }
        end
    end

    def post_values
        params.require(:post).permit(:title, :body)
    end

end