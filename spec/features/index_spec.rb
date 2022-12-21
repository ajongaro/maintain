require 'rails_helper'

RSpec.describe 'the main index page', type: :feature do
  let!(:task) { Task.create!(
    title: "Empty drying rack",
    description: "It's full",
    location: "Kitchen",
    priority: 5,
    category: "Household",
    time_commitment: 15,
    frequency: "weekly",
    )}

  describe 'the task area' do
    it 'has a button to display a task' do
      visit '/'

      expect(page).to have_button("Summon Task")
      expect(page).to have_content("Maintain")
    end

    it 'displays a task after clicking button' do
      visit '/'

      expect(page).to have_button("Summon Task")
      click_button("Summon Task")

      expect(page).to have_content("Empty drying rack")
    end
  end

  describe 'creating a new task' do
    it 'has a button to create a task' do
      visit '/'

      expect(page).to have_button("Create Task")
    end

    it 'can click button and go to new task form' do
      visit '/'

      expect(page).to have_button("Create Task")

      click_button("Create Task")

      expect(current_path).to eq("/tasks/new")
      expect(page).to have_field("Title")
    end
  end
end