class UsersController < ApplicationController
  def index
    @users = User.all

    render({ :template => "users/index" })
  end

  def create
    @user = User.new
    @user.username = params.fetch("input_username")

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "user created successfully." })
    else
      redirect_to("/users", { :notice => "user failed to create successfully." })
    end
  end

  def show
    username = params[:path_id] # Fetch the username from the URL parameters
    @user = User.find_by(username: username) # Find the user by the username
    # Proceed to render the view if the user is found
    if @user
      render({ :template => "users/show" })
    end
  end

  def update
    id = params.fetch("path_id")
    @user = User.find(id)

    @user.username = params.fetch("input_username")

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "User updated successfully."} )
    end
  end
end
