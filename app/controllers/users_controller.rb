class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.first
    @user = User.find(params[:id])
    # => app/views/users/show.html.erb
    # debugger
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save # => Validation
      # Success
      # redirect_to user_path(@user.id)
      # redirect_to user_path(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # GET "/users/#{@user.id}" => show
    else
      # Failure
      render 'new' # newテンプレートを呼び出す
    end
  end
  
  def user_params
    params.require(:user).permit(
      :name, :email, :password,
      :password_confirmation)
  end
end
