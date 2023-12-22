# lib/swagger_docs/api_v1.rb
class Swagger::Docs::Config
    def self.transform_path(path, api_version)
      "apidocs/#{path}"
    end
  end
  
  Swagger::Docs::Config.base_api_controller = ActionController::API
  Swagger::Docs::Config.register_apis({
    "1.0" => {
      controller_base_path: "",
      api_file_path: "public/apidocs",
      base_path: "http://localhost:3000", # Update with your API host
      clean_directory: true
    }
  })
  