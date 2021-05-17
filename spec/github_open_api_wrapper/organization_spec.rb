require 'spec/spec_helper'

describe GithubOpenApiWrapper::Organization do
  describe ".path" do
    context "with name" do
      it "returns name api path" do
        path = GithubOpenApiWrapper::Organization.path 'github_open_api_wrapper'
        expect(path).to eq 'orgs/github_open_api_wrapper'
      end
    end

    context "with id" do
      it "returns id api path" do
        path = GithubOpenApiWrapper::Organization.path 3430433
        expect(path).to eq 'organizations/3430433'
      end
    end
  end
end
