require 'spec_helper'

describe ApplicationHelper do

    describe "full_title" do
        it "should include the page title" do
            expect(full_title("foo")).to match(/foo/)
        end

        it "should include the base title" do
            expect(full_title("foo")).to match(/^Ruby on Rails Tutorial Sample App/)
        end

        it "should not include a bar for the home page" do
            expect(full_title("")).not_to match(/\|/)
        end
    end
end

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
