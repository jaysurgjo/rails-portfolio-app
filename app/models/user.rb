class User < ApplicationRecord

  validates :username, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
  has_many :tasks, class_name: "Task", dependent: :destroy
  has_many :comments
  #has_many :commented_tasks, through: :comments, source: :task
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
  validates :password, confirmation: { case_sensitive: true }

  def email_activate
      self.email_confirmed = true
      self.confirm_token = nil
      save!(:validate => false)
    end

    def self.find_or_create_from_auth(info)
      user = User.find_or_create_by(email: info.email)

      pass = SecureRandom.hex
      user.username = info.nickname
      user.email = info.email
      user.password = pass
      user.password_confirmation = pass
      user.save
      user
    end

  private
  def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

end
