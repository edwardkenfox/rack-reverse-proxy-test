require "pry"

app = proc do |env|
  [ 200, {'Content-Type' => 'text/plain'}, ["hello from origin"] ]
end
run app
