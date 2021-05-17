require 'spec/spec_helper'

describe GitHubOpenApiWrapper::Client::Organizations do

  before do
    GitHubOpenApiWrapper.reset!
    @client = oauth_client
  end

  describe ".organization", :vcr do
    it "returns an organization" do
      organization = @client.organization("codeforamerica")
      expect(organization.name).to eq("Code for America")
      assert_requested :get, github_url("/orgs/codeforamerica")
    end
  end # .organization
end
