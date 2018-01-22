Spree::Variant.class_eval do
  delegate_belongs_to :default_price, :sale_price, :original_price, :on_sale?

  def active_sale_in(currency)
    price_in(currency).active_sale
  end
  alias_method :current_sale_in, :active_sale_in

  def disable_sale(all_currencies = true)
    run_on_prices(all_currencies, &:disable_sale)
  end

  def discount_percent_in(currency)
    price_in(currency).discount_percent
  end

  def enable_sale(all_currencies = true)
    run_on_prices(all_currencies, &:enable_sale)
  end

  def next_active_sale_in(currency)
    price_in(currency).next_active_sale
  end
  alias_method :next_current_sale_in, :next_active_sale_in

  def on_sale_in?(currency)
    price_in(currency).on_sale?
  end

  def original_price_in(currency)
    Spree::Price.new variant_id: id, currency: currency, amount: price_in(currency).original_price
  end

  def put_on_sale(value, calculator_type = 'Spree::Calculator::DollarAmountSalePriceCalculator',
                  all_currencies = true, start_at = Time.now, end_at = nil, enabled = true)
    run_on_prices(all_currencies) { |p| p.put_on_sale(value, calculator_type, start_at, end_at, enabled) }
  end
  alias_method :create_sale, :put_on_sale

  def sale_price_in(currency)
    Spree::Price.new variant_id: id, currency: currency, amount: price_in(currency).sale_price
  end

  def start_sale(end_time = nil, all_currencies = true)
    run_on_prices(all_currencies) { |p| p.start_sale end_time }
  end

  def stop_sale(all_currencies = true)
    run_on_prices(all_currencies, &:stop_sale)
  end

  private

  def run_on_prices(all_currencies)
    if all_currencies && prices.present?
      prices.each { |v| yield v }
    else
      yield default_price
    end
  end
end
