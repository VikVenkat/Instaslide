class Whiteboard < ActiveRecord::Base
  # Paperclip'd image, into Turk
  has_attached_file :pic
  
  before_save :clean_filename
  
  belongs_to :user

  	# Devise
	def self.visible_by(user)
	  if user.is_admin
		Whiteboard.all
	  else
	    Whiteboard.where :user_id => user.id
	  end
	end

  
  def clean_filename
     pic_file_name.gsub!(' ', '_')
  end

end
