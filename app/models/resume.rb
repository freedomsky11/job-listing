class Resume < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :job_id, presence: true # Make sure the owner's name is present.
  belongs_to :user
  belongs_to :job
  validates :content, presence: true
end
