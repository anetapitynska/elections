class CreateJoinTableCommiteeVoivodeship < ActiveRecord::Migration
  def change
  	 create_table :commitees_voivodeships, id: false do |t|
        t.integer :commitee_id
      t.integer :voivodeship_id
   
  end
end
