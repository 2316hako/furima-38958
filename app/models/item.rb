class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :area
  belongs_to :day

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range", only_integer: true }
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :cost_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
end
