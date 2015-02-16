class AddCommiteeIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :commitee_id, :integer
  end
end
