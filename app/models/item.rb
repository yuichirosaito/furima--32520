class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_area
  belongs_to :delivery_fee
  belongs_to :delivery_span
  belongs_to :status
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :explaination
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image, presence: true
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :delivery_area_id
      validates :delivery_span_id
    end
  end
end
