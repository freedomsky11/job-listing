class Resume < ApplicationRecord
  validates :job_id, presence: true
  validates :user_id, presence: true
  validates :attachment, presence: true
  validates :content, presence: true  
  mount_uploader :attachment, AttachmentUploader # Tells rials to use this uploader for this model.

  belongs_to :job
  belongs_to :user
end
