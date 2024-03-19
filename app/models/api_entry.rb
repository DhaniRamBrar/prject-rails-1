class ApiEntry < ApplicationRecord
  belongs_to :category
  has_many :faker_data, dependent: :destroy

  validates :api_name, presence: true
  validates :link, presence: true
  validates :category_id, presence: true
end
