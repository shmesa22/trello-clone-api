module Api
  module V1
    class TasksController < ApplicationController
      before_action :get_current_list

      def index
        tasks = Task.all
        render json: tasks
      end

      def show
        task = Task.find(params[:id])
        render json: task
      end

      def create
        task = Task.new(task_params)
        task.list = @current_list
        if task.save
          render json: task
        else
          render json: { errors: task.errors }, status: 422
        end
      end

      def update
        task = Task.find(params[:id])
        if task.update(task_params)
          render json: task
        else
          render json: { errors: task.errors }, status: 422
        end
      end

      def destroy
        task = Task.find(params[:id])
        task.destroy

        head :no_content
      end

      private
        def task_params
          params.require(:task).permit(:title, :done)
        end
    end
  end
end
