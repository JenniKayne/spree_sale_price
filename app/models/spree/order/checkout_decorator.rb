Spree::Order::Checkout.class_eval do
  Spree::Order.state_machine.before_transition to: :complete, do: :save_line_items_original_price
  Spree::Order.state_machine.before_transition to: :complete, do: :save_line_items_final_sale

  def save_line_items_original_price
    line_items.each(&:set_original_price)
  end

  def save_line_items_final_sale
    line_items.each(&:set_final_sale)
  end
end
