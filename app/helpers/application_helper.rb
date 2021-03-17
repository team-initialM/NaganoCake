module ApplicationHelper
  def include_tax(price)
    tax = 1.1
    ((price * tax).round(2)).ceil
  end
end
