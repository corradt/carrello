class CreateOrderedProducts < ActiveRecord::Migration
  def change
    create_table :ordered_products do |t|
      t.integer :quantity, default:1
      t.integer :product_id
      t.integer :cart_id
      t.decimal :price_per_unit, precision:8,scale:2

      t.timestamps null: false
    end
  end
end
