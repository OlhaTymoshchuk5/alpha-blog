class User < ApplicationRecord
    #self referecing each obleject of this class. To target each object!!!
    before_save { self.email = email.downcase }
    #if your is deleted an dependences will be deleted too
    has_many :articles, dependent: :destroy
    validates :username, presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end