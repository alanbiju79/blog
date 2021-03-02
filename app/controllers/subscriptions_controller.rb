class SubscriptionsController < ApplicationController

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.account_id = current_account.id
        @subscription.save
        
        redirect_to publication_path(@subscription.publication_id)
    end

    def subscription_params
        params.require(:subscription).permit(:publication_id)
    end

end