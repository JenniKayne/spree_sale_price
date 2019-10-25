Spree::AppConfiguration.class_eval do
  preference :enable_sale_prices, :boolean, default: false
end
