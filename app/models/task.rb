class Task < ApplicationRecord
  validates :name, presence: true
  validates :facts, presence: true
  validates :comments, presence: true
  belongs_to :user
  #has_many :users
  #has_many :projects, through: :tasks, source: :projects
  scope :complete, -> {where(task: "completed")}
end
