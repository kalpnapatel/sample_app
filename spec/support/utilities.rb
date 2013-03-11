include ApplicationHelper

def valid_sign_in(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def valid_sign_up(email)
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: email
  fill_in "Password",     with: "foobar"
  fill_in "Confirmation", with: "foobar"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_title do |message|
  match do |page|
    page.should have_selector('title', text: message)
  end
end

RSpec::Matchers.define :have_h1 do |message|
  match do |page|
    page.should have_selector('h1', text: message)
  end
end
