class AddEmptyVotesToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :empty_votes, :integer
  end
end
