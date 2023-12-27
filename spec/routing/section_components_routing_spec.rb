require "rails_helper"

RSpec.describe SectionComponentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/section_components").to route_to("section_components#index")
    end

    it "routes to #new" do
      expect(get: "/section_components/new").to route_to("section_components#new")
    end

    it "routes to #show" do
      expect(get: "/section_components/1").to route_to("section_components#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/section_components/1/edit").to route_to("section_components#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/section_components").to route_to("section_components#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/section_components/1").to route_to("section_components#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/section_components/1").to route_to("section_components#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/section_components/1").to route_to("section_components#destroy", id: "1")
    end
  end
end
