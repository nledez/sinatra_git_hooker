require 'sinatra'

class SinatraGitHookerServer < Sinatra::Base
  get '/' do
    "Hello World!"
  end

  get '/:token' do |token|
    unless ENV['GIT_REPO_HOOK_TOKEN'] == token
      halt 404
    end
  end
end
