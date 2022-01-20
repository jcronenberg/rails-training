class BoardThreadsController < ApplicationController
  def show
    @board_thread = BoardThread.find(params[:id])
  end

  def new
    unless params[:board_id]
      redirect_to root_path
    end
    @thread = BoardThread.new
  end

  def create_new
    unless params[:board_id]
      redirect_to root_path
    end
    permitted_params = params.require(:board_thread).permit(:title, :content, :username, :board_id)
    permitted_params[:board_id] = params[:board_id]
    if current_user
      permitted_params[:username] = current_user.username
      permitted_params[:user_id] = current_user.id
    end
    @thread = BoardThread.new(permitted_params)
    if @thread.save
      flash[:ok] = "Created new thread"
      redirect_to board_thread_show_path(@thread.id)
    else
      flash[:error] = "Couldn't create thread"
      redirect_to board_threads_new_path(board_id: params[:board_id])
    end
  end
end
