class CreateCommiteesVoivodeships < ActiveRecord::Migration
  def change
    create_table :commitees_voivodeships, :id => false do |t|
      t.references :commitee, :voivodeship
    end

    add_index :commitees_voivodeships, [:commitee_id, :voivodeship_id],
      name: "commitees_voivodeships_index",
      unique: true
  end
end
