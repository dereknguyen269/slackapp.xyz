class HealthController < ApplicationController
  layout false

  def index
    @ironman = IronMan::BaseService.new.class.ironman
    status = @ironman.auth_test
    status = status && status['ok'] == true ? 'All systems operational' : "Oh noo! Sorry :'(, we will fixed soon"
    render json: {status: status} , status: 200
  end

end