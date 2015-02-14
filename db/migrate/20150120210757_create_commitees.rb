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
    create_table :commitees_voivodeships, id: false do |t|
        t.integer :commitee_id
     	t.integer :voivodeship_id
   
    end
  end
end

def change
  rename_table :voivodeships_commitees, :commitees_voivodeships
end