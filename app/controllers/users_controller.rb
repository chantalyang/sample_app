#Contains methods to render pages associated with users
class UsersController < ApplicationController
    before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers] #Check for singned_in user before edit and update actions
   before_action :correct_user,   only: [:edit, :update] #Check for correct user for edit and update actions
   before_action :admin_user,     only: :destroy #Check for admin user before destroy action

  
  #Method to render Index Page
 def index
  @users = User.paginate(page: params[:page])
  end

  #Method to render View User Page  (Show)	
  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
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
      sign_in @user #Sign in user
      flash[:success] = "Welcome to the Sample App!" #Display welcome to the sample app
      redirect_to @user #Redirect to the user show page
    else #Else
      render 'new' #Render new page 
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private #Makes method only available to current class

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

 def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
