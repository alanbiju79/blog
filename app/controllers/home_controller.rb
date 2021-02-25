class HomeController < ApplicationController

    def index
        @posts = Post.order(id: :desc).limit(20)
    end
    
end