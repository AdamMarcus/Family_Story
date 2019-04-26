# Parent class
class ApplicationController < ActionController::Base
    # Declare global static @@currentUser variable.
    @@currentUser = User.new
end
