class FakerDatum < ApplicationRecord
  belongs_to :api_entry

  validates :user_name, presence: true
  validates :user_email, presence: true
  validates :api_entry_id, presence: true
end
