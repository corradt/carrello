class AddAttachmentResourceToStaffMembers < ActiveRecord::Migration
  def self.up
    change_table :staff_members do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :staff_members, :resource
  end
end
