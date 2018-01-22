class AddFinalSaleToVariants < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_variants, :final_sale, :boolean, default: false
  end
end
