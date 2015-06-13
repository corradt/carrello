class Product < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /^image\/(png|gif|jpg|jpeg)/,
 	message: "only images are allowed"
 	validates :image, attachment_presence: true
	
end
