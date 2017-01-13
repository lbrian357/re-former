class User < ApplicationRecord
  validates :username, presence: true#, length: {minimum: 3}, uniqueness: {case_sensitive: false}
  validates :email, presence: true#, uniqueness: {case_sensitive: false}
  validates :password, presence: true#, length: {minimum: 6}
end
