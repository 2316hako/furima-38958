class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :area
  belongs_to :day

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :cost_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user, presence: true
end
