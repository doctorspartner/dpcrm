class Contact < ActiveRecord::Base
  validates_presence_of :last_name
  belongs_to :company
end
