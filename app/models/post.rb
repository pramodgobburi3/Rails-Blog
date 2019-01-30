class Post < ApplicationRecord
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :reported_posts, dependent: :destroy
    
    validates :title, presence: true, length: {minimum: 5}
end