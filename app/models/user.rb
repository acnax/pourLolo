class User < ApplicationRecord
	belongs_to :city
	has_many :comments
	has_many :gossips, dependent: :destroy
end
