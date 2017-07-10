class User < ApplicationRecord
    has_many :posts
    has_many :comments
    validates :username, presence: true, uniqueness: true
    validates :password, confirmation: true
    validates :password_confirmation, presence: true, uniqueness: true
end
