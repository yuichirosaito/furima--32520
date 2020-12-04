class OrderForm 
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token
  
    with_options presence: true do
        validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
        validates :prefecture_id, numericality: { other_than: 1 }
        validates :city
        validates :block
        validates :phone_number, length: { maximum: 11 }  
        validates :item_id
        validates :user_id
        validates :token
      end 
  
    def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
    end
end
