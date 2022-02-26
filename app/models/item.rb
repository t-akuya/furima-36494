class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipment_days
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40}
    validates :price, numericality: { only_integer: true, greater_than: 299,less_than: 10000000}, 
                      format:       { with: /\A[0-9]+\z/ }
    validates :text, length: {maximum: 1000}
  end

  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :delivery_id
    validates :prefecture_id
    validates :shipment_days_id
  end
end