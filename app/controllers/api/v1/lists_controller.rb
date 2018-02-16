module Api
  module V1
    class ListsController < ApplicationController
      before_action :get_current_board

      def index
        lists = List.all
        render json: lists
      end

      def create
        list = List.new(list_params)
        list.board = @current_board
        if list.save
          render json: list
        else
          render json: { errors: list.errors }, status: 422
        end
      end

      def update
        list = List.find(params[:id])
        if list.update(list_params)
          render json: list
        else
          render json: { errors: list.errors }, status: 422
        end
      end

      def destroy
        list = List.find(params[:id])
        list.destroy

        head :no_content
      end

      private
        def list_params
          params.require(:list).permit(:title)
        end
    end
  end
end
