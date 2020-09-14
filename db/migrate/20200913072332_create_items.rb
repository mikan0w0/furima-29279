class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references     :user,        null: false 
      t.string         :name,        null: false 
      t.text           :info,        null: false 
      t.integer        :categories,  null: false 
      t.integer        :state,       null: false 
      t.integer        :ship_charge, null: false 
      t.integer        :ship_from,   null: false 
      t.integer        :ship_takes,  null: false 
      t.integer        :price,       null: false 
      t.timestamps
    end
  end
end
