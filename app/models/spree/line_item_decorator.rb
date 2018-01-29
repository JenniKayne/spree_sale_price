Spree::LineItem.class_eval do
  def set_original_price
    update_column(:original_price, variant.original_price) if variant.present?
  end

  def set_final_sale
    update_column(:final_sale, variant.final_sale) if variant.final_sale
  end
end
