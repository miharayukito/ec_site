class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    has_many :books, through: :order_details

    def total_price
        order_details.sum {|order| order.total_price_book }
    end

    def total_number
        order_details.sum {|order| order.quantity }
    end

    #validates :count, presence: true, numericality: {only_integer: true, greater_than: 0}
    validates :address, presence: true
end
