class Registry < ActiveRecord::Base
  belongs_to :event
  mount_uploader :logo, LogoUploader
end
