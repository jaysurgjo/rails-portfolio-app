class User < ApplicationRecord
  before_create :confirmation_token

  validates :username, presence: true, length: { maximum: 30 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  has_many :tasks, dependent: :destroy
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true

  def email_activate
      self.email_confirmed = true
      self.confirm_token = nil
      save!(:validate => false)
    end

  has_many :tasks, through: :assignments

  private
  def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
      end
end
