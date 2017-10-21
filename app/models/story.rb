# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  genre_id    :integer
#

class Story < ApplicationRecord
  belongs_to :user
  has_many :genres
  has_many :lines
end
