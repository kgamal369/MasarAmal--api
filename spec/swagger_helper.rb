config.openapi_root = Rails.root.join('public', 'api', 'v1').to_s

config.openapi_specs = {
  'swagger.json' => {
    openapi: '3.0.1',
    info: {
      title: 'API V1',
      version: 'v1'
    },
    paths: {},
    servers: [
      {
        url: 'https://{defaultHost}',
        variables: {
          defaultHost: {
            default: 'www.example.com'
          }
        }
      }
    ]
  }
}
