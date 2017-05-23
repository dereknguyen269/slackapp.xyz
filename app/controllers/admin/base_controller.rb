class Admin::BaseController < ApplicationController
  before_action :check_authenticate
  layout 'application'

  def check_authenticate
    if params[:message] && params[:message][:via] == 'task'
      true
    else
      authenticate_user!
    end
  end
end
