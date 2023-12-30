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
        let(:id) { CmsValue.create(pagesectionid: 1, sectioncomponentid: 1, languageid: 1, value: 'Example').cmsvalueid }
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
        required: ['pagesectionid', 'sectioncomponentid', 'languageid', 'value']
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
        let(:id) { CmsValue.create(pagesectionid: 1, sectioncomponentid: 1, languageid: 1, value: 'Example').cmsvalueid }
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
        let(:id) { CmsValue.create(pagesectionid: 1, sectioncomponentid: 1, languageid: 1, value: 'Example').cmsvalueid }
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
  path '/cms_values/page/{page_name}' do
    get 'Retrieves CMS values by page' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :page_name, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:page_name) { 'HomePage' }
        run_test!
      end
    end
  end

  # filter_by_page_and_language
  path '/cms_values/{page_name}/{language}' do
    get 'Retrieves CMS values by page and language' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :page_name, in: :path, type: :string
      parameter name: :language, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:page_name) { 'HomePage' }
        let(:language) { 'en' }
        run_test!
      end
    end
  end

  # filter_by_page_and_section
  path '/cms_values/page/{page_name}/section/{section_name}' do
    get 'Retrieves CMS values by page and section' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :page_name, in: :path, type: :string
      parameter name: :section_name, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:page_name) { 'HomePage' }
        let(:section_name) { 'Hero' }
        run_test!
      end
    end
  end

  # filter_by_page_section_and_language
  path '/cms_values/page/{page_name}/section/{section_name}/language/{language}' do
    get 'Retrieves CMS values by page, section, and language' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :page_name, in: :path, type: :string
      parameter name: :section_name, in: :path, type: :string
      parameter name: :language, in: :path, type: :string

      response '200', 'CMS values found' do
        let(:page_name) { 'HomePage' }
        let(:section_name) { 'Hero' }
        let(:language) { 'en' }
        run_test!
      end
    end
  end

 # ...

# filter_by_page_section_and_component
path '/cms_values/page/{page_name}/section/{section_name}/component/{component_name}' do
    get 'Retrieves CMS values by page, section, and component' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :page_name, in: :path, type: :string
      parameter name: :section_name, in: :path, type: :string
      parameter name: :component_name, in: :path, type: :string
  
      response '200', 'CMS values found' do
        let(:page_name) { 'HomePage' }
        let(:section_name) { 'Hero' }
        let(:component_name) { 'PageTitle' }
        run_test!
      end
    end
  end
  
  # filter_by_page_section_component_and_language
  path '/cms_values/page/{page_name}/section/{section_name}/component/{component_name}/language/{language}' do
    get 'Retrieves CMS values by page, section, component, and language' do
      tags 'CmsValues'
      produces 'application/json'
      parameter name: :page_name, in: :path, type: :string
      parameter name: :section_name, in: :path, type: :string
      parameter name: :component_name, in: :path, type: :string
      parameter name: :language, in: :path, type: :string
  
      response '200', 'CMS values found' do
        let(:page_name) { 'HomePage' }
        let(:section_name) { 'Hero' }
        let(:component_name) { 'PageTitle' }
        let(:language) { 'en' }
        run_test!
      end
    end
  end
  
  # ... rest of your existing specs ...
  

end
