class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            lenght: { minumum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            lenght: { maximum:105 },
            format: { with: VALID_EMAIL_REGEX }
end