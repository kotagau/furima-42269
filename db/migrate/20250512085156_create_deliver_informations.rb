class CreateDeliverInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :deliver_informations do |t|
      t.integer    :prefecture_id  ,null:false
      t.string     :post_code      ,null:false
      t.string     :address         ,null:false
      t.string     :building       ,null:false
      t.string     :phone_number   ,null:false
      t.references :bought_item    ,foreign_key:true
      t.string     :city           ,null:false

      t.timestamps
    end
  end
end
