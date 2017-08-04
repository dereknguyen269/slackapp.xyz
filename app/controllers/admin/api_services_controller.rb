class Admin::ApiServicesController < Admin::BaseController
  before_action :prepare_api_service, except: [:index, :new, :create]

  def index
    @api_services = ApiService.all
  end

  def new
    @api_service = ApiService.new
  end

  def create
    @api_service = ApiService.create(api_service_params)
    if @api_service.save
      redirect_to admin_api_services_path, {notice: 'API Service has been created successfully!'}
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @api_service.update(api_service_params)
      redirect_to edit_admin_api_service_path(@api_service), {notice: 'API Service has been updated successfully!'}
    else
      render 'edit'
    end
  end

  def destroy
    if @api_service.destroy
      redirect_to admin_api_services_path, {notice: 'API Service has been removed successfully!'}
    end
  end

  private

    def api_service_params
      params.require(:api_service).permit(:name, :api_url, :status, api_service_infos_attributes: [:id, :app_name, :app_id, :app_secret, :app_token, :status, :_destroy])
    end

    def prepare_api_service
      @api_service = ApiService.find(params[:id])
    end
end
