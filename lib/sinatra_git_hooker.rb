require 'sinatra'

class SinatraGitHookerServer < Sinatra::Base
  get '/' do
    "Hello World!"
  end

  get '/:token' do |token|
    unless ENV.has_key? 'GIT_HOOK_COMMAND'
      halt 500
    end

    if ENV['GIT_REPO_HOOK_TOKEN'] == token
      `#{ENV['GIT_HOOK_COMMAND']}`
    else
      halt 404
    end
  end
end
