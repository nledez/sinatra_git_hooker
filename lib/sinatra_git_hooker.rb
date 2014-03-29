require 'sinatra'

class SinatraGitHookerServer < Sinatra::Base
  get '/' do
    "Hello World!"
  end

  get '/:token' do |token|
    halt 404
  end
end
