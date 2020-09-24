class CreateShipTos < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_tos do |t|
      t.string  :post_code,      default: "",  null: false
      t.integer :prefecture,                   null: false
      t.string  :city,           default: ""
      t.string  :address,        default: ""
      t.string  :building,       default: ""
      t.integer :phone,          default: ""
      t.references :order,                     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
