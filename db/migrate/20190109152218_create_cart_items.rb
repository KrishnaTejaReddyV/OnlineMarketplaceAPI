class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.decimal :price
      t.integer :inventory_count
      t.integer :p_id

      t.timestamps
    end
  end
end
