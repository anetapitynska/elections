class AddIncorrectVotesToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :incorrect_votes, :integer
  end
end
