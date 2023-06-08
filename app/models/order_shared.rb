class OrderShared
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shared.create(post_code: post_code, prefecture_id: prefecture_id, city: city, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end