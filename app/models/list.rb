# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :string
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord
  has_many :tasks
  belongs_to :board

  validates :title, presence: true
end
