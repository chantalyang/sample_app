#Contains methods to render pages associated with users
class UsersController < ApplicationController
   before_action :signed_in_user, only: [:edit, :update]
   #Check for singned_in user before edit and update actions
  
  #Method to render View User Page  (Show)	
  def show
  	@user = User.find(params[:id])
  end

  #Method to render the edit page
  def edit
    @user = User.find(params[:id])
  end

  #Method to render New User Page
  def new
  	@user = User.new
  end

  #Method to render edit page   
   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #Method to render create page
  def create
    @user = User.new(user_params) #Call the user params method to fetch params   
    if @user.save #If save successful
      flash[:success] = "Welcome to the Sample App!" #Display welcome to the sample app
      redirect_to @user #Redirect to the user show page
    else #Else
      render 'new' #Render new page 
    end
  end

  private #Makes method only available to current class

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

#Render signed in user?
def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end
