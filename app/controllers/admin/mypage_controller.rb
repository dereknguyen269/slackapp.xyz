class Admin::MypageController < Admin::BaseController
  before_action :prepare_user

  def index
  end

  def edit
  end

  def update
    if user_params[:current_password].present?
      if @user.update_with_password(user_params)
        flash['success'] = 'Profile has been updated successfully!'
        redirect_to admin_mypage_index_url
      else
        render 'edit'
      end
    else
      flash['error'] = 'Please enter your current password!'
      render 'edit'
    end
  end

  private

    def prepare_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :current_password)
    end
end
