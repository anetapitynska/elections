class RenameColumnFieldnameInTableAreasToBallots < ActiveRecord::Migration
  def change
  	rename_column :areas, :fieldname, :ballots
  end
end
