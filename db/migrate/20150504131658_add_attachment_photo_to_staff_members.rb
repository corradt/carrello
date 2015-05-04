class AddAttachmentPhotoToStaffMembers < ActiveRecord::Migration
  def self.up
    change_table :staff_members do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :staff_members, :photo
  end
end
