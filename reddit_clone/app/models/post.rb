class Post < ApplicationRecord
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
        
    has_many :post_subs,
        foreign_key: :post_id,
        class_name: :PostSub
        
    has_many :subs,
        through: :post_subs,
        source: :sub
end
