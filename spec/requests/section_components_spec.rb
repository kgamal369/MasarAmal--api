require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/section_components", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # SectionComponent. As you add validations to SectionComponent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      SectionComponent.create! valid_attributes
      get section_components_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      section_component = SectionComponent.create! valid_attributes
      get section_component_url(section_component)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_section_component_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      section_component = SectionComponent.create! valid_attributes
      get edit_section_component_url(section_component)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SectionComponent" do
        expect {
          post section_components_url, params: { section_component: valid_attributes }
        }.to change(SectionComponent, :count).by(1)
      end

      it "redirects to the created section_component" do
        post section_components_url, params: { section_component: valid_attributes }
        expect(response).to redirect_to(section_component_url(SectionComponent.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new SectionComponent" do
        expect {
          post section_components_url, params: { section_component: invalid_attributes }
        }.to change(SectionComponent, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post section_components_url, params: { section_component: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested section_component" do
        section_component = SectionComponent.create! valid_attributes
        patch section_component_url(section_component), params: { section_component: new_attributes }
        section_component.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the section_component" do
        section_component = SectionComponent.create! valid_attributes
        patch section_component_url(section_component), params: { section_component: new_attributes }
        section_component.reload
        expect(response).to redirect_to(section_component_url(section_component))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        section_component = SectionComponent.create! valid_attributes
        patch section_component_url(section_component), params: { section_component: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested section_component" do
      section_component = SectionComponent.create! valid_attributes
      expect {
        delete section_component_url(section_component)
      }.to change(SectionComponent, :count).by(-1)
    end

    it "redirects to the section_components list" do
      section_component = SectionComponent.create! valid_attributes
      delete section_component_url(section_component)
      expect(response).to redirect_to(section_components_url)
    end
  end
end
