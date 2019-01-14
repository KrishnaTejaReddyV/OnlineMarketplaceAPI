class UsersController < ApplicationController

    # Function to return json of all users or users queried through query parameters
    def index
        if(params.key?("name"))
            @users = User.where(name: params[:name])
        elsif(params.key?("id"))
            @users = User.where(id: params[:id])
        else
            @users = User.all
        end
        json_response(@users)
    end
    
    # Function to return json of requested user
    def show
        @user = User.find(params[:id])
        redirect_to user_products_path(@user)
    end

    # Function to create a new user
    def create
        @user = User.create!(user_params)
        json_response(@user, :created)
    end

    # Function to update a user
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to users_path
    end

    # Function to delete a user
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
        # Helper function for input validation
        def user_params
            params.permit(:name)
        end
end
