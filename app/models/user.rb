class User < ActiveRecord::Base

  # this is a callback function. See more at http://api.rubyonrails.org/v4.2.0/classes/ActiveRecord/Callbacks.html
  before_save { self.email.downcase! }

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6 }
  has_secure_password
end