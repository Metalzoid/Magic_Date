class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :category
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
