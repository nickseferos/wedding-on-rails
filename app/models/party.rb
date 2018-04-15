class Party < ActiveRecord::Base
  belongs_to :event
  mount_uploader :image, PartyImageUploader
end
