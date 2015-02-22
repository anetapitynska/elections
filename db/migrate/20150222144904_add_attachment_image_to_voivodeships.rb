class AddAttachmentImageToVoivodeships < ActiveRecord::Migration
  def self.up
    change_table :voivodeships do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :voivodeships, :image
  end
end
