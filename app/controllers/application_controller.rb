class ApplicationController < ActionController::API
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def get_current_board
    @current_board = Board.find(params[:board_id])
  end

  def get_current_list
    @current_list = List.find(params[:list_id])
  end
end
