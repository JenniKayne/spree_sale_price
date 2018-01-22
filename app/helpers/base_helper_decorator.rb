Spree::BaseHelper.class_eval do
  def display_original_price(product_or_variant)
    Spree::Money.new(product_or_variant.original_price, currency: current_currency).to_html
  end

  def amount_discount_percent(product_or_variant, currency = 'USD')
    discount = product_or_variant.discount_percent_in currency

    if discount.zero? &&
        product_or_variant.on_sale_in?(currency) &&
        !product_or_variant.sale_price.nil? &&
        product_or_variant.sale_price != product_or_variant.original_price
      discount = ((1 - (product_or_variant.sale_price / product_or_variant.original_price)) / 0.05).round * 0.05 * 100
    end
    discount
  end

  def display_discount_percent(product_or_variant, append_text = 'Off')
    discount = amount_discount_percent(product_or_variant, current_currency)
    # number_to_percentage(discount, precision: 0).to_html
    if discount > 0
      return "#{number_to_percentage(discount, precision: 0).to_html} #{append_text}"
    else
      return ''
    end
  end
end
