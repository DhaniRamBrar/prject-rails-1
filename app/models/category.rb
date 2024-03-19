class Category < ApplicationRecord
  has_many :api_entries, dependent: :destroy
  validates :name, presence: true
end
