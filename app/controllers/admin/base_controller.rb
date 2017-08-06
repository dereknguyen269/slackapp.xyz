class Admin::BaseController < ApplicationController

  protect_from_forgery
  layout 'application'

  before_action :authenticate_user!, :authorize_access

  private

  def pundit_user
    current_user
  end

  def authorize_access
    authorize :user, :access?
  end

  def user_not_authorized_path
    root_path
  end
end
