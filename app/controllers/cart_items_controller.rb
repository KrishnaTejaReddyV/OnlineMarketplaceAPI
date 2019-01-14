class CartItemsController < ApplicationController
    before_action :update_count, except: [:addtocart]
    before_action :get_total_price, only: [:index]

    # Function to return json of all cart items of the user or cart items queried through query parameters
    def index
        @user = User.find(params[:user_id])
        count = 0

        if(params.key?("title"))
            @cart_items = @user.cart_items.where(title: params[:title])
        elsif(params.key?("price"))
            @cart_items = @user.cart_items.where(price: params[:price])
        elsif(params.key?("inventory_count"))
            @cart_items = @user.cart_items.where(inventory_count: params[:inventory_count])
        elsif(params.key?("p_id"))
            @cart_items = @user.cart_items.where(p_id: params[:p_id])
        elsif(params.key?("id"))
            @cart_items = @user.cart_items.where(id: params[:id])
        else
            @cart_items = @user.cart_items.all
            count = 1
        end

        if(count == 1)
            json_response_with_price(@total_price, @cart_items)
        else
            json_response(@cart_items)
        end
    end

    # Function to return json of requested cart item of the user
    def show
        @user = User.find(params[:user_id])
        @cart_item = @user.cart_items.find(params[:id])
        json_response(@cart_item)
    end

    # Function to add products into the cart of the user
    def addtocart
        @product = Product.find(params[:id])
        if @product.inventory_count != 0
            @user = User.find(params[:user_id])
            @cart_item = @user.cart_items.create!(title: @product.title, price: @product.price, inventory_count: @product.inventory_count, p_id:@product.id)
            redirect_to user_cart_item_path(@user, @cart_item)
        else
            json_response({Error: 'Operation Not Allowed as Inventory is Empty'})
        end
    end

    # Function to complete the cart which involves purchasing available cart items, reducing the inventory_count for the purchased products, and emptying the cart
    def complete
        @user = User.find(params[:user_id])
        @cart_items = @user.cart_items.where.not(inventory_count: 0)

        @cart_items.each do |item|
            Product.transaction do
                i = Product.lock.find(item.p_id)
                i.inventory_count = item.inventory_count - 1
                i.save!
                @user.purchased_items.create(title: i.title, price: i.price)
                item.destroy
            end
        end

        # To reset id from 1 if cart is empty
        if(CartItem.count == 0)
            CartItem.destroy_all
            ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cart_items'")
        end

        redirect_to user_purchased_items_path(@user)
    end

    # Function to remove a cart item from the cart
    def removefromcart
        @user = User.find(params[:user_id])
        @cart_item = @user.cart_items.find(params[:id])
        @cart_item.destroy

        if(CartItem.count == 0)
            CartItem.destroy_all
            ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cart_items'")
        end
       
        redirect_to user_cart_items_path(@user)
    end
    
    private
        # Helper function to calculate the total price of products in the cart
        def get_total_price
            @user = User.find(params[:user_id])
            @total_price = @user.cart_items.sum("price")
        end

        # Helper function to update inventory count of cart items with that of their corresponding products before performing actions on them
        def update_count
            @user = User.find(params[:user_id])
            @cart_items = @user.cart_items.all
            @cart_items.each do |item|
                @user.cart_items.transaction do
                    i = @user.cart_items.lock.find(item.id)
                    product = Product.find(i.p_id)
                    if i.inventory_count != product.inventory_count
                        i.inventory_count = product.inventory_count
                        i.save!
                    end
                    
                    if i.inventory_count == 0
                        i.destroy
                    end
                end
            end

            if(CartItem.count == 0)
                CartItem.destroy_all
                ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cart_items'")
            end
        end
end
