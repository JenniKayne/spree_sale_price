Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'add_admin_sale_price_to_product',
  replace: '[data-hook="admin_product_form_price"]',
  partial: 'spree/admin/products/form_price'
)
