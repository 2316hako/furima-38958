class OrderShared
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building_name, :telephone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, presence: true
    validates :city, presence: true
    validates :address, presence: true
    validates :building_name
    validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    
  end
end