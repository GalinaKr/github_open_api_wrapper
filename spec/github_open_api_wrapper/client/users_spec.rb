require 'spec/spec_helper'

describe GitHubOpenApiWrapper::Client::Users do

  before(:each) do
    GitHubOpenApiWrapper.reset!
    @client = oauth_client
  end

  describe ".user", :vcr do
    it "returns a user" do
      user = GitHubOpenApiWrapper.client.user("sferik")
      expect(user.login).to eq('sferik')
    end

    it "handle [bot] users", :vcr do
      user = GitHubOpenApiWrapper.client.user("shipit[bot]")
      expect(user.login).to eq('shipit[bot]')
    end

    it "returns the authenticated user" do
      user = @client.user
      expect(user.login).to eq(test_github_login)
    end
  end # .user
end
