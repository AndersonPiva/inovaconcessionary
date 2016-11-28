class AddAttachmentCoverToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :cover, :images
  end
end
