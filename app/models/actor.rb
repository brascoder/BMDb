class Actor < ActiveRecord::Base
  validates :name, presence: true

  has_many :roles
  has_many :movies, through: :roles
end
