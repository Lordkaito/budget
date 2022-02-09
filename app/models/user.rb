class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }
  validates_uniqueness_of :email, case_sensitive: false

  def admin?
    role == 'admin'
  end

  def recent_added_groups
    groups.order(created_at: :desc).limit(5)
  end
end
