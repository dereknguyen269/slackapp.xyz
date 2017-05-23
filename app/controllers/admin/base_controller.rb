class Admin::BaseController < ApplicationController
  before_action :check_authenticate
  protect_from_forgery with: :null_session
  layout 'application'

  def check_authenticate
    via_param = params.permit(:via)
    if via_param && via_param[:via] == 'task'
      true
    else
      authenticate_user!
    end
  end
end
