require 'spec_helper'

describe "User pages" do

  subject {page}

  describe "signup page" do
    let(:user) {FactoryGirl.create(:user)}
    # Code to make a user variable
    before {visit signup_path(user)}

    it {should have_selector('h1', text: 'Sign up')}
    it {should have_selector('title', text: full_title('Sign up'))}

  end

  describe "singup" do
    before {visit signup_path}
    let (:submit) {"Create my account"}

    describe "with invalid information" do
      it "shoult not create user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "manhtu123"
        fill_in "Confirmation", with: "manhtu123"
      end


      it "should create a user" do
        expect {click_button submit}.to change(User, :count).by(1)
      end
    end
  end
end
