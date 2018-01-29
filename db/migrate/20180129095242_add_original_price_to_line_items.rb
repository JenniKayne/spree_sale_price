class AddOriginalPriceToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_line_items, :original_price, :decimal, precision: 10, scale: 2, null: false, default: 0
    add_column :spree_line_items, :final_sale, :boolean, default: false
    Spree::LineItem.all.each do |line_item|
      if line_item.variant.present?
        line_item.update_column(:original_price, line_item.variant.original_price)
        line_item.update_column(:final_sale, line_item.variant.final_sale)
      end
    end
  end
end
