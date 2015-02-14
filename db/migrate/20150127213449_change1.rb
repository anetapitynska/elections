class Change1 < ActiveRecord::Migration
class CreateCommiteesVoivodeshipsJoinTable < ActiveRecord::Migration
  def change
   		create_table :commitees_voivodeships, id: false do |t|
        t.integer :commitee_id, :null => false
     	t.integer :voivodeship_id, :null => false
   
    end
  end
end
end
