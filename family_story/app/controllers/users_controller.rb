# This controller interacts with all user dialogs and REST verbs
class UsersController < ApplicationController

    # Display the form for new user
    def new
        # Will have template: Create new account
        @user = User.new
    end

    # Save new user record
    def create
        # Will not have template, save new account and direct to browse page or back go login page
        tempUsername = allowed_params[:username]
        # Check if the user being created already exists in the DB
        if User.exists?(username: tempUsername)
            # If the username already exists
            puts ("## Verified username #{tempUsername} already exists.")
            # Show alert in the users new.html.erb view
            flash[:notice] = "Username #{tempUsername} already exists. Please pick a different username."
            # Redirect the user back to the new.html.erb view
            redirect_to users_new_path
        else
            # If the username does not exist
            puts "## Verified no user by username exists. Creating new user."
            # Create a new user using the specified parameters
            @user = User.new(allowed_params)
            
            if @user.save
                print("Creating a new user " + @user.username + ".")
                # Set the global currentUser to the new user
                @@currentUser = User.where(username: tempUsername).take
                # Redirect the user to the stories path
                redirect_to stories_path
            else
                render 'new'
            end
        end
    end

    # Login page to login to existing account
    def loginpage
        @user = User.new
    end

    # Method called when user attempts loggin
    def validatelogin
        tempUsername = allowed_params[:username]
        puts ("## #{tempUsername} ##")
        # Check if the username exists
        if  User.exists?(username: tempUsername)
            # If the username exists
            puts ("## Verified username #{tempUsername} already exists.")
            # Set the global currentUser
            @@currentUser = User.where(username: tempUsername).take
            puts ("## #{@@currentUser.username} ##")
            # Redirect user to browse page
            redirect_to stories_path    
        else 
            # If the user does not exist
            # Notify the user in the loginpage.html.erb that the username was not found
            flash[:notice] = "No Username \"#{tempUsername}\" was found."
            # Redirect the user back to the oginpage.html.erb
            redirect_to users_loginpage_path
        end
    end

    # This route is a test route that can be rendered when testing to make sure routing is working as expected.
    def testroute
        @users = User.all
    end

    private
        # This method restricts the params that get passed in to the class methods to prevent injection attacks
        def allowed_params
            # Only this one attribute will be allowed, no hacking
            params.require(:user).permit(:username)
        end
    
end
