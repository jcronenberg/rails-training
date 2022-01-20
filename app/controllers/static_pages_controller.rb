class StaticPagesController < ApplicationController
  def main
    @boards = Board.order(priority: :asc)
  end
end
