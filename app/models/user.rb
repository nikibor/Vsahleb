# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :integer
#

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true

  has_many :stories
end
