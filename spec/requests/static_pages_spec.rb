require 'spec_helper'


describe "StaticPages" do

#Describe the home page
  describe "Home page" do

  	#When you visit the home page, content should contain
  	#The Words "Sample App"
  	it "should have the content 'Sample App' " do
  		#Simulate
  		visit '/static_pages/home' #Visit page
  		expect(page).to have_content('Sample App') #Expect page to have "Sample App"
  	end
  end

  describe "Help page" do

  	it "should have the content 'Help' " do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end
  end

  describe "About Page" do

  	it "should have the content 'About Us'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About Us')
  	end
  

  it "should have the right title" do
  	visit '/static_pages/home'
  	expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
  end
 end

end
