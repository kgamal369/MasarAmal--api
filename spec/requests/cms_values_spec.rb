# frozen_string_literal: true

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

RSpec.describe '/cms_values', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # CmsValue. As you add validations to CmsValue, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      CmsValue.create! valid_attributes
      get cms_values_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      cms_value = CmsValue.create! valid_attributes
      get cms_value_url(cms_value)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_cms_value_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      cms_value = CmsValue.create! valid_attributes
      get edit_cms_value_url(cms_value)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new CmsValue' do
        expect do
          post cms_values_url, params: { cms_value: valid_attributes }
        end.to change(CmsValue, :count).by(1)
      end

      it 'redirects to the created cms_value' do
        post cms_values_url, params: { cms_value: valid_attributes }
        expect(response).to redirect_to(cms_value_url(CmsValue.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new CmsValue' do
        expect do
          post cms_values_url, params: { cms_value: invalid_attributes }
        end.to change(CmsValue, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cms_values_url, params: { cms_value: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested cms_value' do
        cms_value = CmsValue.create! valid_attributes
        patch cms_value_url(cms_value), params: { cms_value: new_attributes }
        cms_value.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the cms_value' do
        cms_value = CmsValue.create! valid_attributes
        patch cms_value_url(cms_value), params: { cms_value: new_attributes }
        cms_value.reload
        expect(response).to redirect_to(cms_value_url(cms_value))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        cms_value = CmsValue.create! valid_attributes
        patch cms_value_url(cms_value), params: { cms_value: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested cms_value' do
      cms_value = CmsValue.create! valid_attributes
      expect do
        delete cms_value_url(cms_value)
      end.to change(CmsValue, :count).by(-1)
    end

    it 'redirects to the cms_values list' do
      cms_value = CmsValue.create! valid_attributes
      delete cms_value_url(cms_value)
      expect(response).to redirect_to(cms_values_url)
    end
  end
end
