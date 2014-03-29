require 'sinatra'

class SinatraGitHookerServer < Sinatra::Base
  get '/' do
    "Hello World!"
  end
end
