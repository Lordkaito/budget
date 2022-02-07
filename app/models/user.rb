class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities
  has_many :groups

  validates :name, presence: true, length: { maximum: 50 }

  def admin?
    role == 'admin'
  end
end
