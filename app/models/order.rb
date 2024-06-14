class Order < ApplicationRecord
    validates :count, presence: true, numericality: {only_integer: true, greater_than: 0}
end
