require 'rails_helper'

RSpec.describe "admin/photo_attrs/show", type: :view do
  before(:each) do
    @admin_photo_attr = assign(:admin_photo_attr, Admin::PhotoAttr.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
