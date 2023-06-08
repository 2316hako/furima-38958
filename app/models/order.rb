class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  has_one :shared
  belongs_to :item
  validates :token, presence: true
end
