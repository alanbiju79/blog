class Publication < ApplicationRecord
    belongs_to :account
    has_many :posts
    validates_presence_of :url, :name, :bio
end