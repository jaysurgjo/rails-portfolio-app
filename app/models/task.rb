class Task < ApplicationRecord
  validates :name, presence: true
  validates :facts, presence: true
  validates :comments, presence: true
  belongs_to :user
end
