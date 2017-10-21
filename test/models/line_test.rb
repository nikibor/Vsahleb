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

require 'test_helper'

class LineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
