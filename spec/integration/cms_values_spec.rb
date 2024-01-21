# frozen_string_literal: true

require 'swagger_helper'

describe 'CmsValues API' do
  # Index action
  path '/cms_values' do
    get 'Retrieves all CMS values' do
      tags 'CmsValues'
      produces 'application/json'

      response '200', 'CMS values found' do
        # Define the response schema
        # Add more fields as per your CmsValue model
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   cmsvalueid: { type: :integer },
                   pagesectionid: { type: :integer },
                   sectioncomponentid: { type: :integer },
                   languageid: { type: :integer },
                   value: { type: :string }
                 }
               }

        run_test!
      end
    end
  end

  # Show action
  path '/cms_values/{id}' do
    get 'Retrieves a CMS value' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'CMS value found' do
        # Define response schema
        let(:id) do
          CmsValue.create(pagesectionid: 1, sectioncomponentid: 1, languageid: 1, value: 'Example').cmsvalueid
        end
        run_test!
      end

      response '404', 'CMS value not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  # Create action
  path '/cms_values' do
    post 'Creates a CMS value' do
      tags 'CmsValues'
      consumes 'application/json'
      parameter name: :cms_value, in: :body, schema: {
        type: :object,
        properties: {
          pagesectionid: { type: :integer },
          sectioncomponentid: { type: :integer },
          languageid: { type: :integer },
          value: { type: :string }
        },
        required: %w[pagesectionid sectioncomponentid languageid value]
      }

      response '201', 'CMS value created' do
        let(:cms_value) { { pagesectionid: 1, sectioncomponentid: 1, languageid: 1, value: 'Example Value' } }
        run_test!
      end
    end
  end

  # Update action
  path '/cms_values/{id}' do
    put 'Updates a CMS value' do
      tags 'CmsValues'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :cms_value, in: :body, schema: {
        type: :object,
        properties: {
          pagesectionid: { type: :integer },
          sectioncomponentid: { type: :integer },
          languageid: { type: :integer },
          value: { type: :string }
        }
      }

      response '200', 'CMS value updated' do
        let(:id) do
          CmsValue.create(pagesectionid: 1, sectioncomponentid: 1, languageid: 1, value: 'Example').cmsvalueid
        end
        let(:cms_value) { { value: 'New Value' } }
        run_test!
      end
    end
  end

  # Destroy action
  path '/cms_values/{id}' do
    delete 'Deletes a CMS value' do
      tags 'CmsValues'
      parameter name: :id, in: :path, type: :integer

      response '204', 'CMS value deleted' do
        let(:id) do
          CmsValue.create(pagesectionid: 1, sectioncomponentid: 1, languageid: 1, value: 'Example').cmsvalueid
        end
        run_test!
      end
    end
  end

  # Custom actions
  # filter_by_language
  path '/cms_values/language/{language}' do
    get 'Retrieves CMS values by language' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :language, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:language) { 'en' }
        run_test!
      end
    end
  end

  # filter_by_page
  path '/cms_values/page/{pagename}' do
    get 'Retrieves CMS values by page' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :pagename, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:pagename) { 'HomePage' }
        run_test!
      end
    end
  end

  # filter_by_page_and_language
  path '/cms_values/{pagename}/{language}' do
    get 'Retrieves CMS values by page and language' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :pagename, in: :path, type: :string
      parameter name: :language, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:pagename) { 'HomePage' }
        let(:language) { 'en' }
        run_test!
      end
    end
  end

  # filter_by_page_and_section
  path '/cms_values/page/{pagename}/section/{sectionname}' do
    get 'Retrieves CMS values by page and section' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :pagename, in: :path, type: :string
      parameter name: :sectionname, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:pagename) { 'HomePage' }
        let(:sectionname) { 'Hero' }
        run_test!
      end
    end
  end

  # filter_by_page_section_and_language
  path '/cms_values/page/{pagename}/section/{sectionname}/language/{language}' do
    get 'Retrieves CMS values by page, section, and language' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :pagename, in: :path, type: :string
      parameter name: :sectionname, in: :path, type: :string
      parameter name: :language, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:pagename) { 'HomePage' }
        let(:sectionname) { 'Hero' }
        let(:language) { 'en' }
        run_test!
      end
    end
  end

  # ...

  # filter_by_page_section_and_component
  path '/cms_values/page/{pagename}/section/{sectionname}/component/{componentname}' do
    get 'Retrieves CMS values by page, section, and component' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :pagename, in: :path, type: :string
      parameter name: :sectionname, in: :path, type: :string
      parameter name: :componentname, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:pagename) { 'HomePage' }
        let(:sectionname) { 'Hero' }
        let(:componentname) { 'PageTitle' }
        run_test!
      end
    end
  end

  # filter_by_page_section_component_and_language
  path '/cms_values/page/{pagename}/section/{sectionname}/component/{componentname}/language/{language}' do
    get 'Retrieves CMS values by page, section, component, and language' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :pagename, in: :path, type: :string
      parameter name: :sectionname, in: :path, type: :string
      parameter name: :componentname, in: :path, type: :string
      parameter name: :language, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:pagename) { 'HomePage' }
        let(:sectionname) { 'Hero' }
        let(:componentname) { 'PageTitle' }
        let(:language) { 'en' }
        run_test!
      end
    end
  end

  # ... rest of your existing specs ...
end
