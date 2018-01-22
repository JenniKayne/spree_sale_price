Deface::Override.new(
  virtual_path: 'spree/admin/variants/_form',
  name: 'admin_add_final_sale_to_variant',
  insert_after: "[data-hook='cost_price']",
  partial: 'spree/admin/variants/form_final_sale'
)
