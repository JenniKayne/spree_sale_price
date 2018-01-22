Deface::Override.new(
  virtual_path: 'spree/admin/variants/_form',
  name: 'add_admin_sale_price_to_variant',
  replace: '[data-hook="price"]',
  partial: 'spree/admin/variants/form_price'
)
