class HomeController < ApplicationController

    def index
        @posts = Post.order(id: :desc).limit(20)
    end

    def profile
        @profile = Account.find_by_username params[:username]
        @posts = @profile.posts
    end
    
end