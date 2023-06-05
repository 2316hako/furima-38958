class Order < ApplicationRecord
  belongs_to :user
  has_one :shared
  belongs_to :item
end
