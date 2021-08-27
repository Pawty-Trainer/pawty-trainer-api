class User < ApplicationRecord
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password, presence: true, confirmation: true

    has_many :dogs, dependent: :destroy

    has_secure_password
end
