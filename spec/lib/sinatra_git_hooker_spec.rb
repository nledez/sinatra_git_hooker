require File.dirname(__FILE__) + '../../spec_helper'
set :environment, :test

describe "My Traffic light server" do
  include Rack::Test::Methods

  def app
    @app || SinatraGitHookerServer
  end

  # Do a root test
  it "should respond to /" do
    get '/'
    last_response.should be_ok
    last_response.body.should == "Hello World!"
  end

  it "should respond a error 500 if GIT_HOOK_COMMAND is undefined" do
    token = "ce1ecd9a-6c0b-49b3-8daa-8314389d4067"
    ENV['GIT_REPO_HOOK_TOKEN'] = token
    ENV.delete 'GIT_HOOK_COMMAND'

    post "/#{token}"
    last_response.should be_server_error
  end

  it "should create a dynamic route" do
    token = "ce1ecd9a-6c0b-49b3-8daa-8314389d4067"
    ENV['GIT_HOOK_COMMAND'] = "echo 'Already up-to-date.'"

    ENV['GIT_REPO_HOOK_TOKEN'] = ''
    post "/#{token}"
    last_response.should be_not_found

    ENV['GIT_REPO_HOOK_TOKEN'] = token
    post "/#{token}"
    last_response.should be_ok
    last_response.body.should == "Already up-to-date.\n"
  end
end
