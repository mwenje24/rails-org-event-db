class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :category_id
      t.string :location
      t.date :date
      t.time :time
      t.integer :owner_id
      t.text :description
      t.integer :fee
      t.string :image

      t.timestamps
    end
  end
end
