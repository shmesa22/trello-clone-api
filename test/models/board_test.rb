# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  isFavorited :boolean          default(FALSE)
#

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "Shouldn't create board without title" do
    board = Board.new()
    assert_not board.save
  end
end
