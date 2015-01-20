class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :people
      t.references :voivodeship, index: true

      t.timestamps null: false
    end
    add_foreign_key :areas, :voivodeships
  end
end
