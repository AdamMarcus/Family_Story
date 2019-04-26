class StoriesController < ApplicationController
    
    # On browse page list all stories
    def index
        # Will have browse page template
        # make all Stories available in a variable to the view
        @stories = Story.all
        # Make the current user available to the view
        @user = @@currentUser
    end

    # Read an individual story
    def show
        # Will have read page template
        @story = Story.find(params[:id])
        @user = @@currentUser
    end

    # Display form for new story
    def new
        @story = Story.new
    end

    # Save new story record
    def create
        # Crate a new story from the allowed paramaeters
        @story = Story.new(allowed_params)

        # If the save was successful
        if @story.save
            # redirect them to the browse page
            redirect_to stories_path
        else
            render 'new'
        end
    end

    # Edit an existing story
    # def edit
    # This not implemented in first version, but maybe in future
    # end

    # Save edits to existing story
    # def update
    # This not implemented in first version, but maybe in future
    # end

    # Delete an existing story
    # def destroy
    # This not implemented in first version, but maybe in future
    # end

    private
        def allowed_params
            # Prevent injection attack
            params.require(:story).permit(:title, :body)
        end
end
