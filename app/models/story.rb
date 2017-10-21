class Story < ApplicationRecord
  belongs_to :user
  has_many :genres
  has_many :lines
end
