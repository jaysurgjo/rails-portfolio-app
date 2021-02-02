class Project < ApplicationRecord
  belongs_to :user
  #belongs_to :task
  #has_many :tasks  #, through: :projects, source: :tasks
  validates :title, presence: true
  validates :description, presence: true
end
