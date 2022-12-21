class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :priority, presence: true
  validates :category, presence: true
  validates :time_commitment, presence: true
  validates :frequency, presence: true
end