class Order < ApplicationRecord
has_many :line_items, dependent: :destroy

 enum payment_type: {
"Check" 		=> 0,
"Credit card" 	=> 1,
"Purchase order"=> 2
}

validates :name, :address, :email, presence: true
validates :payment_type, inclusion: payment_types.keys

def add_line_items_from_cart(cart)
cart.line_items.each do |item|
item.cart_id = nil
line_items << item
end
end

end
