class Article < ApplicationRecord
	has_many :comments, dependent: :destroy #when an article is deleted, all comments will, also, been deleted.
	validates :title, presence: true,
					  length: {minimum: 5}

end
