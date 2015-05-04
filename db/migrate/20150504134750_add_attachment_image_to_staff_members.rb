class AddAttachmentImageToStaffMembers < ActiveRecord::Migration
  def self.up
    change_table :staff_members do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :staff_members, :image
  end
end
