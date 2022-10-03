class Diet < ApplicationRecord
  has_one :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :meals
  scope :without_owner, -> { where(owner_id: nil) }
end
