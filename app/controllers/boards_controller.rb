class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
    @board_threads = BoardThread.where(board_id: params[:id])
  end
end
