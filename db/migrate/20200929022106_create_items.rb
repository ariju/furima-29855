class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                          null: false, foreign_key: true
      t.string     :product_name,                  null: false
      t.text       :product_name_description,      null: false
      t.integer    :category_id,                   null:false
      t.integer    :product_condition_id,          null:false
      t.integer    :burden_of_shipping_charges_id, null:false
      t.integer    :shipping_area_id,              null:false
      t.integer    :days_to_ship_id,               null:false
      t.integer    :price,                         null:false
      t.timestamps null:false
    end
  end
end
