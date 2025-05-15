class CreateBoughtItems < ActiveRecord::Migration[7.1]
  def change
    create_table :bought_items do |t|
      t.references :item    , foreign_key:true,null:false
      t.references :user    , foreign_key:true,null:false
      t.timestamps
    end
  end
end
