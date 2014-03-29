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
end
