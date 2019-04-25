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
        if User.exists?(username: tempUsername)
            puts ("## Verified username #{tempUsername} already exists.")
            flash[:notice] = "Username #{tempUsername} already exists. Please pick a different username."
            redirect_to users_new_path
        else
            puts "## Verified no user by username exists. Creating new user."
            @user = User.new(allowed_params)
            
            if @user.save
                # do something
                print("Creating a new user " + @user.username + ".")
                @@currentUser = User.where(username: tempUsername).take
                redirect_to stories_path
            else
                render 'new'
            end
        end
        # Add code here to check if username already exists in DB!

        # If the save was successful

    end

    def loginpage
        @user = User.new
    end

    def validatelogin
        tempUsername = allowed_params[:username]
        puts ("## #{tempUsername} ##")
        if  User.exists?(username: tempUsername)
            puts ("## Verified username #{tempUsername} already exists.")
            @@currentUser = User.where(username: tempUsername).take
            puts ("## #{@@currentUser.username} ##")
            redirect_to stories_path    
        else 
            flash[:notice] = "No Username \"#{tempUsername}\" was found."
            redirect_to users_loginpage_path
        end
    end

    def testroute
        @users = User.all
    end

    private
        def allowed_params
            # Only this one attribute will be allowed, no hacking
            params.require(:user).permit(:username)
        end
    
end
