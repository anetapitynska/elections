class CreateCommitees < ActiveRecord::Migration
  def change
    create_table :commitees do |t|
      t.string :name
      t.references :voivodeship, index: true

      t.timestamps null: false
    end
    add_foreign_key :commitees, :voivodeships
  end
end



class CreateVoivodeshipsCommiteesJoinTable < ActiveRecord::Migration
  def change
    create_table :voivodeships_commitees, id: false do |t|
      t.integer :voivodeship_id
      t.integer :commitee_id
    end
  end
end