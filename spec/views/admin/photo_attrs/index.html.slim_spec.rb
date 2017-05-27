require 'rails_helper'

RSpec.describe "admin/photo_attrs/index", type: :view do
  before(:each) do
    assign(:admin_photo_attrs, [
      Admin::PhotoAttr.create!(),
      Admin::PhotoAttr.create!()
    ])
  end

  it "renders a list of admin/photo_attrs" do
    render
  end
end
