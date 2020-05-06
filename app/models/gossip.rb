class Gossip < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :tags

	validates :title, presence: true, length: { in: 4..20 }
	validates :content, presence: true
end
