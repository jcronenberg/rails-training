class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    # return if session[:user_id].blank?
    # return @cached_current_user if @cached_current_user
    # @cached_current_user = User.find_by(id: session[:user_id])

    session[:user_id].present? && (@cached_current_user || (@cached_current_user = User.find_by(id: session[:user_id])))
  end
end
