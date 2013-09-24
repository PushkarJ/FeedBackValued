require 'spec_helper'

describe "Customers" do
  describe "Get Feedback  page" do
    it "Verify contents of the getFeedback page" do
      visit '/getFeedback'
      expect(page).to have_content('Customer')
      expect(page).to have_field('Name')
    end
  end
end
