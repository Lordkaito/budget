class Entity < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :group, optional: true, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
