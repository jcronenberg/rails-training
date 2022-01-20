class BoardThreadsController < ApplicationController
  def show
    @board_thread = BoardThread.find(params[:id])
  end
end
