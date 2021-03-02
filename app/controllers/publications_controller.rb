class PublicationsController < ApplicationController
    before_action :authenticate_account!, except: [:index, :show ]
    before_action :set_publication, only: [:show]

    def index
        @publications = Publication.all
    end

    def show
        @posts = @publication.posts
        @subscriber_count = @publication.subscribers.count
        @is_subscribed = account_signed_in? ? Subscription.where(publication_id: @publication.id, account_id: current_account.id).any? : false
        @subscription = Subscription.new
    end

    def new
        @publication = Publication.new
    end

    def create
        @publication = Publication.new publication_values
        @publication.account_id = current_account.id
        if @publication.save
            redirect_to publications_path
        else
            render :new
        end

    end
    

    private

    def set_publication
        @publication = Publication.find(params[:id])
    end

    def publication_values
        params.require(:publication).permit(:name, :url, :bio)
    end

end