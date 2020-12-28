class Task < ApplicationRecord
  validates :name, presence: true
  validates :facts, presence: true
  belongs_to :user
  validates :user_id, presence: true
  has_many :users, through: :assignments
end
