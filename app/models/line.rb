# == Schema Information
#
# Table name: lines
#
#  id         :integer          not null, primary key
#  speaker    :string
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :integer
#

class Line < ApplicationRecord
  belongs_to :story, optional: true
end
