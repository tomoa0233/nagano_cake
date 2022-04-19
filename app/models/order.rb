class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }

  def order_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end


end
