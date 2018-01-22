Spree::Product.class_eval do
  delegate_belongs_to :master, :active_sale_in, :current_sale_in,
                      :next_active_sale_in, :next_current_sale_in,
                      :sale_price_in, :on_sale_in?, :original_price_in,
                      :discount_percent_in, :sale_price, :original_price

  def disable_sale(all_variants = true)
    run_on_variants(all_variants, &:disable_sale)
  end

  def enable_sale(all_variants = true)
    run_on_variants(all_variants, &:enable_sale)
  end

  def put_on_sale(value, calculator_type = 'Spree::Calculator::DollarAmountSalePriceCalculator', all_variants = true, start_at = Time.now, end_at = nil, enabled = true)
    run_on_variants(all_variants) { |v| v.put_on_sale(value, calculator_type, true, start_at, end_at, enabled) }
  end
  alias_method :create_sale, :put_on_sale

  def start_sale(end_time = nil, all_variants = true)
    run_on_variants(all_variants) { |v| v.start_sale(end_time) }
  end

  def stop_sale(all_variants = true)
    run_on_variants(all_variants, &:stop_sale)
  end

  private

  def run_on_variants(all_variants)
    variants.each { |v| yield v } if all_variants && variants.present?
    yield master
  end
end
