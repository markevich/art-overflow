### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy enod", :email => "example@example.com",
    :password => "please", :password_confirmation => "please" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  delete destroy_user_session_path
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit new_user_registration_path
  fill_in "Name", :with => @visitor[:name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Password confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit new_user_session_path
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

def create_account_in_facebook
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    :provider => :facebook,
    "uid" => 123455678,
    "info" => {"email" => "example@example.com"},
    "extra" => {
      "raw_info" => {
        "name" => "Testy"
        }
      }
    })
end
### GIVEN ###
Given /^I am not logged in$/ do
  delete destroy_user_session_path
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit destroy_user_session_path
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

Given /^that following omniauth account exist$/ do
  create_account_in_facebook
end

Given /^that account with facebook exist$/ do
  create_account_in_facebook
  create_account_with_facebook
end
