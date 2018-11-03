module Api
  module V1
    class BoardsController < ApplicationController
      def index
        boards = Board.all
        render json: boards
      end

      def show
        board = Board.find(params[:id])
        render json: board.to_json(include: [:lists])
      end

      def create
        board = Board.new(board_params)
        if board.save
          render json: board
        else
          render json: { errors: board.errors }, status: 422
        end
      end

      def update
        board = Board.find(params[:id])
        if board.update(board_params)
          render json: board
        else
          render json: { errors: board.errors }, status: 422
        end
      end

      def destroy
        board = Board.find(params[:id])
        board.destroy

        head :no_content
      end

      private
        def board_params
          params.require(:board).permit(:title, :description)
        end
    end
  end
end
