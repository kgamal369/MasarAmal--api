# config/initializers/swagger_docs.rb
Swagger::Docs::Config.register_apis({
  'v1/swagger.json' => {
    openapi: '3.0.1',
    info: {
      title: 'Your API Documentation',
      version: 'v1',
    },
  },
})
