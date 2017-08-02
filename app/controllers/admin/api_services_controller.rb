class Admin::ApiServicesController < Admin::BaseController
  def index
    @api_services = ApiService.all
  end

  def new
    @api_service = ApiService.new
  end

  def create
    @api_service = ApiService.create(api_service_params)
    if @api_service.save
      redirect_to :action => 'index', :flash => {notice: 'API Service has been created successfully!'}
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def api_service_params
      params.require(:api_service).permit(:name, :api_url, :status, api_service_infos_attributes: [:app_name, :app_id, :app_secret, :app_token, :status, :_destroy])
    end
end
