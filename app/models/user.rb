class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :foods
  has_many :recipes

  validates :name, presence: true

  def admin?
    role == 'admin'
  end
end
