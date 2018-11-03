class AddIsFavoriteToBoards < ActiveRecord::Migration[5.1]
  def change
    add_column :boards, :isFavorited, :boolean, default: false
  end
end
