class Post < ApplicationRecord
    belongs_to :account
    belongs_to :publication
    validates_presence_of :title, :body, :account_id, :publication_id
    has_many :comments
end