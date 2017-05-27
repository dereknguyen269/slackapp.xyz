require "rails_helper"

RSpec.describe Admin::PhotoAttrsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/photo_attrs").to route_to("admin/photo_attrs#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/photo_attrs/new").to route_to("admin/photo_attrs#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/photo_attrs/1").to route_to("admin/photo_attrs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/photo_attrs/1/edit").to route_to("admin/photo_attrs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/photo_attrs").to route_to("admin/photo_attrs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/photo_attrs/1").to route_to("admin/photo_attrs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/photo_attrs/1").to route_to("admin/photo_attrs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/photo_attrs/1").to route_to("admin/photo_attrs#destroy", :id => "1")
    end

  end
end
