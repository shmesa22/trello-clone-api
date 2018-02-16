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

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = Task.last
    @list = @task.list
    @board = @list.board
  end

  test 'get index: is successful' do
    get api_v1_board_list_tasks_path(locale: 'es', board_id: @board, list_id: @list)
    assert_response :success
  end

  test 'get show: is successful' do
    get api_v1_board_list_task_path(locale: 'es', board_id: @board, list_id: @list, id: @task)
    assert_response :success
  end

  test 'post create: creates a task' do
    assert_difference 'Task.count', 1 do
      post api_v1_board_list_tasks_path(locale: 'es', board_id: @board, list_id: @list), params: { task: { title: 'new task', list: @list } }
      assert_response :success

      assert_equal 'new task', Task.last.title
    end
  end

  test 'put update: edits a task' do
    assert_difference 'Task.count', 0 do
      put api_v1_board_list_task_path(locale: 'es', board_id: @board, list_id: @list, id: @task), params: { task: { title: 'edited task' } }
      assert_response :success

      assert_equal 'edited task', Task.last.title
    end
  end

  test 'put update: changes task status' do
    put api_v1_board_list_task_path(locale: 'es', board_id: @board, list_id: @list, id: @task), params: { task: { done: true } }
    assert_response :success

    assert_equal true, Task.last.done
  end

  test 'patch update: edits a task' do
    assert_difference 'Task.count', 0 do
      patch api_v1_board_list_task_path(locale: 'es', board_id: @board, list_id: @list, id: @task), params: { task: { title: 'edited task' } }
      assert_response :success

      assert_equal 'edited task', Task.last.title
    end
  end

  test 'patch update: changes task status' do
    patch api_v1_board_list_task_path(locale: 'es', board_id: @board, list_id: @list, id: @task), params: { task: { done: true } }
    assert_response :success

    assert_equal true, Task.last.done
  end

  test 'delete destroy: destroys a task' do
    assert_difference 'Task.count', -1 do
      delete api_v1_board_list_task_path(locale: 'es', board_id: @board, list_id: @list, id: @task)
      assert_response :success
    end
  end
end
