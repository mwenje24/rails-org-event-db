class CreateEventCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :event_categories do |t|
      t.string :category_name
      t.text :description

      t.timestamps
    end
  end
end
