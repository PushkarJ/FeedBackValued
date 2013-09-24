require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "Verify contents of the home page" do
      visit '/home'
      expect(page).to have_content('FeedBackValued')
      expect(page).to have_content('Home')
      expect(page).to have_content('Help')
      expect(page).to have_content('Give Feedback')
      expect(page).to have_content('Get Feedback')
    end
    it "Verify if Give Feedback link works" do
      visit '/home'
      click_link "Give Feedback"
      expect(page).to have_content('Contactno')
     end
    it "Verify if Get Feedback link works" do
      visit '/home'
      click_link "Get Feedback"
      expect(page).to have_content('View Customers')
    end
  end
  describe "Help" do

    it "Verify contents of the help page" do
      visit '/help'
      expect(page).to have_content('Call')
      expect(page).to have_content('Email')
    end
  end
end