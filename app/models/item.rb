class Item < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :condition_id, presence: true
  validates :cost_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :category_id, presence: true
  validates :user, presence: true
end
