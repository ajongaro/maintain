require 'rails_helper'

RSpec.describe 'the main page', type: :feature do
  let!(:task) { Task.create!(
    title: "Empty drying rack",
    description: "It's full",
    location: "Kitchen",
    priority: 5,
    category: "Household",
    time_commitment: 15,
    frequency: "Weekly",
    )}
  describe 'the task area' do
    it 'has a button to display a task' do
      visit '/'

      expect(page).to have_button("Display Task")
      expect(page).to have_content("Main Page")
    end

    it 'displays a task after clicking button' do
      visit '/'

      expect(page).to have_button("Display Task")
      click_button("Display Task")

      expect(page).to have_content("Empty drying rack")
    end
  end
end