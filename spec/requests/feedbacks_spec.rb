require 'spec_helper'
require 'capybara/rails'

describe "Feedbacks" do
  describe "Give Feedback page" do
    it "Verify contents of the giveFeedback page" do
      visit '/giveFeedback'
      expect(page).to have_content('Feedback')
      expect(page).to have_unchecked_field('Anonymous')
      expect(page).to have_field('Name')
      expect(page).to have_field('Contactno')
      expect(page).to have_field('Email')
    end
  end
end