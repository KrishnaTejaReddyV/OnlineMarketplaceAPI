class PurchasedItemsController < ApplicationController
    before_action :get_total_price, only: [:index]

    # Function to return json of all purchased items of the user or purchased items queried through query parameters
    def index
        @user = User.find(params[:user_id])
        count = 0

        if(params.key?("title"))
            @purchased_items = @user.purchased_items.where(title: params[:title])
        elsif(params.key?("price"))
            @purchased_items = @user.purchased_items.where(price: params[:price])
        elsif(params.key?("inventory_count"))
            @purchased_items = @user.purchased_items.where(inventory_count: params[:inventory_count])
        elsif(params.key?("id"))
            @purchased_items = @user.purchased_items.where(id: params[:id])
        else
            @purchased_items = @user.purchased_items.all
            count = 1
        end

        if(count == 1)
            json_response_with_price(@total_price, @purchased_items)
        else
            json_response(@purchased_items)
        end
    end

    # Function to return json of requested purchased item of the user
    def show
        @user = User.find(params[:user_id])
        @purchased_item = @user.purchased_items.find(params[:id])
        json_response(@purchased_item)
    end
    
    private
        # Helper function to calculate the total price of purchased products
        def get_total_price
            @user = User.find(params[:user_id])
            @total_price = @user.purchased_items.sum("price")
        end
end
