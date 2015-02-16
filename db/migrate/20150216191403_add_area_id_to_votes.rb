class AddAreaIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :area_id, :integer
  end
end
