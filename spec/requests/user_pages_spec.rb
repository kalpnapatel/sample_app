require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
  
    it { should have_h1(user.name) }
    it { should have_title(user.name) }
  end
  
  describe "signup page" do
  	before { visit signup_path }
  	
  	it { should have_h1('Sign up') }
  	it { should have_title('Sign up') }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe "after submission" do
      	before { click_button submit }
      	it { should have_title('Sign up') }
      	it { should have_content('error') }
      end
    end

    describe "with valid information" do
      let(:email) { "user@example.com" } 
      before { valid_sign_up(email)}
      describe "after saving the user" do
      	before { click_button submit }
      	let(:user) { User.find_by_email(email) }

        it { should have_title(user.name) }
        it { should have_success_message('Welcome') }
        it { should have_link('Sign out') }
      end
    end
  end

end
