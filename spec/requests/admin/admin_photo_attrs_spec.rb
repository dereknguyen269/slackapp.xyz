require 'rails_helper'

RSpec.describe "Admin::PhotoAttrs", type: :request do
  describe "GET /admin_photo_attrs" do
    it "works! (now write some real specs)" do
      get admin_photo_attrs_path
      expect(response).to have_http_status(200)
    end
  end
end
