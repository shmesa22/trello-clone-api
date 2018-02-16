# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string
#  done       :boolean
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "Shouldn't create task without any parameters" do
    task = Task.new()
    assert_not task.save
  end

  test "Shouldn't create task without title" do
    task = Task.new()
    task.list = lists(:one)
    assert_not task.save
  end

  test "Shouldn't create task without a list id" do
    task = Task.new(title: "new title")
    assert_not task.save
  end

  test "Should create task" do
    task = Task.new(title: "new title", list_id: lists(:one))
    assert_not task.save
  end

  test 'done scope only returns done tasks' do
    tasks = Task.where(done: true)
    assert_equal 1, tasks.length

    assert_equal tasks(:done).id, tasks[0].id
  end
end
