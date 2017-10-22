require 'csv'
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
  belongs_to :user, optional: true
  belongs_to :genre
  has_many :lines
  has_many :users

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |story|
        csv << story.attributes.values_at(*column_names)
      end
    end
  end
end
