class OrderSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :id, :paid, :total_items, :total_cost
  has_many :shoes
  belongs_to :user

  def total_items
    self.object.shoes.length
  end

  def total_cost
    summ = self.object.shoes.sum(:cost)
    number_to_currency(summ)
  end 

end
