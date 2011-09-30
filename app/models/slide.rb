class Slide < ActiveRecord::Base
  # Paperclip'ed doc, back from Turk
  has_attached_file :doc
end
