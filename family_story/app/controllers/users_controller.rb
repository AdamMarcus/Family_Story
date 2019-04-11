class UsersController < ApplicationController

    # Display the form for new user
    def new
        # Will have template: Create new account
        @user = User.new
    end

    # Save new user record
    def create
        # Will not have template, save new account and direct to browse page or back go login page
        @user = User.new(allowed_params)
        # Add code here to check if username already exists in DB!

        # If the save was successful
        if @user.save
            # do something
            redirect_to stories_path
        else
            render 'new'
        end
    end

    private
        def allowed_params
            # Only this one attribute will be allowed, no hacking
            params.require(:user).permit(:username)
        end
    
end
