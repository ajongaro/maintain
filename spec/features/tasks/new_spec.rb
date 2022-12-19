require 'rails_helper'

RSpec.describe 'The New Task Page', type: :feature do
  describe 'creating a new task' do
    it 'has a form on the new task page' do
      visit '/tasks/new'

      expect(page).to have_field("Title")
      expect(page).to have_field("Description")
      expect(page).to have_field("Location")
      expect(page).to have_field("Priority")
      expect(page).to have_field("Category")
      expect(page).to have_field("Time commitment")
      expect(page).to have_field("Frequency")
      expect(page).to have_button("Create Task")
    end

    it 'can create a new task' do
      visit '/tasks/new'

      expect(Task.all.count).to eq(0)

      within("div#new_task_form") do
        fill_in("Title", with: "Declutter desk")
        fill_in("Description", with: "Remove all glasses, loose papers, and organize remaining objects.")
        fill_in("Location", with: "Office")
        fill_in("Priority", with: 5)
        select("Household", from: "Category")
        select("15 Minutes", from: "Time commitment")
        select("Weekly", from: "Frequency")
        click_button("Create Task")
      end

      task = Task.where(title: "Declutter desk").first
      expect(task.priority).to eq(5)
      expect(Task.all.count).to eq(1)
    end
  end
end