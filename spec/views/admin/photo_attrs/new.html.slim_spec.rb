require 'rails_helper'

RSpec.describe "admin/photo_attrs/new", type: :view do
  before(:each) do
    assign(:admin_photo_attr, Admin::PhotoAttr.new())
  end

  it "renders new admin_photo_attr form" do
    render

    assert_select "form[action=?][method=?]", admin_photo_attrs_path, "post" do
    end
  end
end
