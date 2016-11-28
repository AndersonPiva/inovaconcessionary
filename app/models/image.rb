class Image < ActiveRecord::Base
  belongs_to :vehicle

  has_attached_file :cover, styles: { :medium => "200x200", :tiny => "100x100" }, default_url: ("/img/missing.png")
  validates_attachment_content_type :cover, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
