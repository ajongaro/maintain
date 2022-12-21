require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:task) { Task.create!(
      title: "Empty drying rack",
      description: "It's full",
      location: "Kitchen",
      priority: 5,
      category: "Household",
      time_commitment: 15,
      frequency: "Weekly",
      )}

  describe 'the Task model' do
    it 'exists' do
      expect(task).to be_a(Task)
      expect(task.title).to eq("Empty drying rack")
      expect(task.location).to eq("Kitchen")
    end
  end
end