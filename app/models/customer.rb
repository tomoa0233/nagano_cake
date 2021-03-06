class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders
  has_many :addresses

  def name_display
    last_name + first_name
  end

  def name_kana_display
    last_name_kana + first_name_kana
  end

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
  end

end
