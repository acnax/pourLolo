class Gossip < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_and_belongs_to_many :tags

	validates :title, presence: true, length: { in: 4..40 }
	validates :content, presence: true
end
