class Whiteboard < ActiveRecord::Base
  # Paperclip'd image, into Turk
  has_attached_file :pic
end
