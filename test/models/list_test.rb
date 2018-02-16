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

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "Shouldn't create list without any parameters" do
    list = List.new()
    assert_not list.save
  end

  test "Shouldn't create board without title" do
    list = List.new()
    list.board = boards(:one)
    assert_not list.save
  end

  test "Shouldn't create board without a list id" do
    list = List.new(title: "new title")
    assert_not list.save
  end
end
