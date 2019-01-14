class ProductsController < ApplicationController
    
    # Function to return json of all products or products queried through query parameters
    def index
        if(params.key?("title"))
            @products = Product.where(title: params[:title])
        elsif(params.key?("price"))
            @products = Product.where(price: params[:price])
        elsif(params.key?("inventory_count"))
            @products = Product.where(inventory_count: params[:inventory_count])
        elsif(params.key?("id"))
            @products = Product.where(id: params[:id])
        else
            @products = Product.all
        end
        json_response(@products)
    end

    # Function to return only the products with non-zero inventory count (i.e, available products)
    def available
        @products = Product.where.not(inventory_count: 0)
        json_response(@products)
    end

    # Function to return json of requested product
    def show
        @product = Product.find(params[:id])
        json_response(params)
    end

    # Function to create a new product
    def create
        @product = Product.create!(product_params)
        json_response(@product, :created)
    end

    # Function to update a product
    def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to user_products_path
    end

    # Function to delete a product
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to user_products_path
    end

    private
        # Helper function for input validation
        def product_params
            params.permit(:title, :price, :inventory_count)
        end
end
