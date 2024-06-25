class Book < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :tags,through: :taggings
    has_many :line_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    has_many :orders, through: :order_details
    has_one_attached :photo

    enum status: {on_sale: 1, sold_out: 2}

    
    def thumbnail
        photo.variant(resize_to_fill:[150, 212])
    end
end
