
class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :identifier, presence: true, uniqueness: true, case_sensitive: false
end