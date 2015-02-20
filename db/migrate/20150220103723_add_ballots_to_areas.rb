class AddBallotsToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :fieldname, :integer
  end
end
