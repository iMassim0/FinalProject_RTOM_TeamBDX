class Order < ApplicationRecord
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user

  before_save :set_subtotal, :set_tax, :set_total

  def subtotal
    order_items.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum
  end

  private

    def set_subtotal
      self[:subtotal] = subtotal
    end

    def set_tax
      self[:tax] = 0.2 * subtotal
    end

    def set_shipping
      if subtotal < 50
        self[:shipping] = 10
      elsif subtotal > 50
        self[:shipping] = 5
      end
    end

    def set_total
      self[:total] = subtotal + self[:shipping].to_f
    end

end
