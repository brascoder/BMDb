class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :genre, presence: true
end
