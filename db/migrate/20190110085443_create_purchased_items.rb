class CreatePurchasedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchased_items do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end
