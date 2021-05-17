require 'spec/spec_helper'

describe GithubOpenApiWrapper::Client::Repositories do
  before do
    GithubOpenApiWrapper.reset!
    @client = oauth_client
  end

  describe ".repositories", :vcr do
    it "returns a user's repositories" do
      repositories = GithubOpenApiWrapper.repositories("sferik")
      expect(repositories).to be_kind_of Array
      assert_requested :get, github_url("/users/sferik/repos")
    end
    it "returns authenticated user's repositories" do
      repositories = @client.repositories
      expect(repositories).to be_kind_of Array
      assert_requested :get, github_url("/user/repos")
    end
  end
end
