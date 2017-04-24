class AddAttachmentFileToStashElements < ActiveRecord::Migration
  def self.up
    change_table :stash_elements do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :stash_elements, :file
  end
end
