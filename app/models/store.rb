class Store < ActiveRecord::Base
  belongs_to :event
  mount_uploader :logo, StoreLogoUploader
end
