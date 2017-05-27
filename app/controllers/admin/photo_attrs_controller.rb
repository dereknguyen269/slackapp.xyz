class Admin::PhotoAttrsController < Admin::BaseController
  before_action :set_admin_photo_attr, only: [:show, :edit, :update, :destroy]

  # GET /admin/photo_attrs
  # GET /admin/photo_attrs.json
  def index
    @admin_photo_attrs = Admin::PhotoAttr.all
  end

  # GET /admin/photo_attrs/1
  # GET /admin/photo_attrs/1.json
  def show
  end

  # GET /admin/photo_attrs/new
  def new
    @admin_photo_attr = Admin::PhotoAttr.new
  end

  # GET /admin/photo_attrs/1/edit
  def edit
  end

  # POST /admin/photo_attrs
  # POST /admin/photo_attrs.json
  def create
    @admin_photo_attr = Admin::PhotoAttr.new(admin_photo_attr_params)

    respond_to do |format|
      if @admin_photo_attr.save
        format.html { redirect_to @admin_photo_attr, notice: 'Photo attr was successfully created.' }
        format.json { render :show, status: :created, location: @admin_photo_attr }
      else
        format.html { render :new }
        format.json { render json: @admin_photo_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/photo_attrs/1
  # PATCH/PUT /admin/photo_attrs/1.json
  def update
    respond_to do |format|
      if @admin_photo_attr.update(admin_photo_attr_params)
        format.html { redirect_to @admin_photo_attr, notice: 'Photo attr was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_photo_attr }
      else
        format.html { render :edit }
        format.json { render json: @admin_photo_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/photo_attrs/1
  # DELETE /admin/photo_attrs/1.json
  def destroy
    @admin_photo_attr.destroy
    respond_to do |format|
      format.html { redirect_to admin_photo_attrs_url, notice: 'Photo attr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_photo_attr
      @admin_photo_attr = Admin::PhotoAttr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_photo_attr_params
      params.require(:admin_photo_attr).permit(:name, :site)
    end
end
