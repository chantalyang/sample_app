#Static Page Class inherits from ApplicationController
class StaticPagesController < ApplicationController
  
  #Home Method to render the view for Home
  #View = home.html.erb file
 def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  #Help Method to render the view for Help
  #View = help.htrml.erb file
  def help
  end

  #Method to render about page
  def about
  end

  #Method to render contact page
  def contact
  end


end
