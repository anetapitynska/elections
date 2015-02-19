class AddAttachmentImageToCommitees < ActiveRecord::Migration
  def self.up
    change_table :commitees do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :commitees, :image
  end
end
