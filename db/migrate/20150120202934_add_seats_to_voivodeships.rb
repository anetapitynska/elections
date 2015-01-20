class AddSeatsToVoivodeships < ActiveRecord::Migration
  def change
    add_column :voivodeships, :seats, :integer
  end
end
