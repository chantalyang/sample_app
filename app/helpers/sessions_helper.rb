module SessionsHelper

	 def sign_in(user)
    remember_token = User.new_remember_token #Create new token
    cookies.permanent[:remember_token] = remember_token #Place enecrypted token into a cookie
    user.update_attribute(:remember_token, User.encrypt(remember_token)) #Update token
    self.current_user = user
  end	

  #Method to check if user is signed in 
  def signed_in? 
    !current_user.nil? #Check if current user is nil then set to false/true value
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
    #||= "or equals" if user nil, set to current user
    #     else previous value specified
    #Set @current_user to user corresponding to remember token only if @current_user is undefined
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    self.current_user = nil #Set current user to nil
    cookies.delete(:remember_token) #Delete cookie
  end

end
