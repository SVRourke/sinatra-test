require './config/environment.rb'

use Rack::Static, :urls => ['/css'], :root => 'public'

run App