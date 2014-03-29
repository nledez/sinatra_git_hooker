require 'sinatra'

class SinatraGitHookerServer < Sinatra::Base
  get '/' do
    "Hello World!"
  end

  get '/:token' do |token|
    if ENV['GIT_REPO_HOOK_TOKEN'] == token
      'Already up-to-date.'
    else
      halt 404
    end
  end
end
