class Task < ApplicationRecord
  validates :name, presence: true
  validates :facts, presence: true
  belongs_to :user
  #has_many :comments
  has_many :users_commented, source: "User", through: :comments
end
