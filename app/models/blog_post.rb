class BlogPost < ApplicationRecord
    belongs_to :user
    has_rich_text :content
    
    validates :user_id, presence: true
    validates :title, presence: true
    validates :content, presence: true
end
