require 'rails_helper'

RSpec.describe "admin/photo_attrs/edit", type: :view do
  before(:each) do
    @admin_photo_attr = assign(:admin_photo_attr, Admin::PhotoAttr.create!())
  end

  it "renders the edit admin_photo_attr form" do
    render

    assert_select "form[action=?][method=?]", admin_photo_attr_path(@admin_photo_attr), "post" do
    end
  end
end
