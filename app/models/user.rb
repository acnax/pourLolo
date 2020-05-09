class User < ApplicationRecord
	belongs_to :city
	has_many :comments
	has_many :gossips, dependent: :destroy

	has_secure_password


	validates :email, presence: true, uniqueness: true
	validates :password_digest, presence: true, length: { minimum: 6 }
	validates_confirmation_of :password_digest
end
