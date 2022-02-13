class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipment_days

  validates :name, :price, :text, :user presence: true

  validates :category_id, :condition_id, :delivery_id,
            :prefecture_id, :shipment_days_id, numericality: { other_than: 1 , message: "can't be blank" }

end
