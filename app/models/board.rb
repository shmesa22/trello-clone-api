# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Board < ApplicationRecord
  has_many :lists

  validates :title, presence: true
end
