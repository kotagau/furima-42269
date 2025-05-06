class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer        :price                 ,null:false
      t.references     :user                  ,null:false,foreign_key: true
      t.string         :product_name          ,null:false
      t.text           :product_explanation   ,null:false
      t.text           :product_category_id   ,null:false
      t.date           :product_status_id     ,null:false
      t.integer        :deliver_fee_payment_id,null:false
      t.integer        :prefecture_id         ,null: false
      t.integer        :deliver_day_id        ,null:false
      t.timestamps     
    end
  end
end
