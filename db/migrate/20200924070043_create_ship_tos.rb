class CreateShipTos < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_tos do |t|
      t.string  :post_code,      default: "",  null: false
      t.integer :prefecture_id,                null: false
      t.string  :city,           default: "",  null: false
      t.string  :address,        default: "",  null: false
      t.string  :building,       default: ""
      t.string  :phone,          default: "",  null: false
      t.references :order,                     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
