class UsersController < ApplicationController

    # Display the form for new user
    def new
        # Will have template: Create new account
        @user = User.new
    end

    # Save new user record
    def create
        # Will not have template, save new account and direct to browse page or back go login page
    end
    
end
