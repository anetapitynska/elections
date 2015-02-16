class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :number

      t.timestamps null: false
    end
  end
end
