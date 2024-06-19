class Book < ApplicationRecord
    has_many :taggings
    has_many :tags,through: :taggings
    has_one_attached :photo

    enum status: {on_sale: 1, sold_out: 2}

    def thumbnail
        photo.variant(resize_to_fill:[200, 200])
    end
end
