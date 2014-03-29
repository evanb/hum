require File.dirname(__FILE__) + '/config/boot'

use Rack::Static, root: 'public', urls: ['/favicon.ico']

run Rack::URLMap.new(
  '/api' => Hum::Api::API
)
