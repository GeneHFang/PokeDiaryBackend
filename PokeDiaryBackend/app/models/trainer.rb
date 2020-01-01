class Trainer < ApplicationRecord
    has_secure_password
    has_many :games

    validates :name, uniqueness: true

    # validates :password_digest, confirmation: true
    # validates :pw_confirmation, presence: true
end
