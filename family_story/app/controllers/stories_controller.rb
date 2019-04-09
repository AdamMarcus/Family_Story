class StoriesController < ApplicationController
    
    # On browse page list all stories
    def index
        # Will have browse page template
        @stories = Story.all
    end

    # Read an individual story
    def show
        # Will have read page template
    end

    # Display form for new story
    def new
        # Will have write page template
        
        # Instantiate a new instance of the Drink class that is empty.
        # This form of variable can be accessed in new.html.erb
        @story = Story.new
    end

    # Save new story record
    def create
        # Will not have own template, save and re-direct to browse page
        # Use allowed parameters to create a new story
        @story = Story.new(allowed_params)

        # If the save was successful
        if @story.save
            # do something
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
            # Only this one attribute will be allowed, no hacking
            params.require(:story).permit(:title, :body)
        end
end
