require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do
    it "should have the h1 'Sample App'" do
    	visit '/static_pages/home'
    	page.should have_selector('h1', :text => 'Sample App')
    end
    
    it "should have title 'Home'" do
    	visit '/static_pages/home'
    	page.should have_selector('title', 
    	                  :text => "SecretSquirrel Sample App | Home")
    end
  end
  
  describe "Help Page" do
  	it "should have the h1 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end
  	
    it "should have title 'Help'" do
    	visit '/static_pages/help'
    	page.should have_selector('title', 
    	                  :text => "SecretSquirrel Sample App | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Me'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Me')
    end
  	
    it "should have title 'About Me'" do
    	visit '/static_pages/about'
    	page.should have_selector('title', 
    	                  :text => "SecretSquirrel Sample App | About Me")
    end
  end
  
end
