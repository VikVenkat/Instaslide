class Slide < ActiveRecord::Base
  # Paperclip'ed doc, back from Turk
  has_attached_file :doc

  before_save :clean_filename
  
  belongs_to :user
  
  	# Devise
	def self.visible_by(user)
	  if user.is_admin
		Slide.all
	  else
	    Slide.where :user_id => user.id
	  end
	end


  
  
  def clean_filename
     doc_file_name.gsub!(' ', '_')
  end

end
