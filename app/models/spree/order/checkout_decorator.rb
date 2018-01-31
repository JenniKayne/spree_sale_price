Spree::Order::Checkout.class_eval do
  Spree::Order.state_machine.before_transition to: :complete, do: :save_line_items_original_price
  Spree::Order.state_machine.before_transition to: :complete, do: :save_line_items_final_sale

  def save_line_items_original_price
    line_items.each do |line_item|
      line_item.update(original_price: line_item.variant.original_price) if line_item.variant.present?
    end
  end

  def save_line_items_final_sale
    line_items.each do |line_item|
      line_item.update(final_sale: line_item.variant.final_sale) if line_item.variant.present?
    end
  end
end
