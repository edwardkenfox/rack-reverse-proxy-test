require 'rack/reverse_proxy'
require "pry"

use Rack::ReverseProxy do
  # Set :preserve_host to true globally (default is true already)
  reverse_proxy_options preserve_host: true

  # Forward the path /test* to http://example.com/test*
  reverse_proxy '/test', 'http://localhost:8002/test'
end

app = proc do |env|
  [ 200, {'Content-Type' => 'text/plain'}, ["hello from proxy"] ]
end
run app
