class AddAreaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :area_id, :string
  end
end
