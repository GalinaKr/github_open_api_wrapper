require 'spec/spec_helper'

describe GitHubOpenApiWrapper::User do
  describe ".path" do
    context "with no user passed" do
      it "returns default path" do
        path = GitHubOpenApiWrapper::User.path nil
        expect(path).to eq 'user'
      end
    end

    context "with login" do
      it "returns login api path" do
        path = GitHubOpenApiWrapper::User.path 'pengwynn'
        expect(path).to eq 'users/pengwynn'
      end
    end

    context "with id" do
      it "returns id api path" do
        path = GitHubOpenApiWrapper::User.path 865
        expect(path).to eq 'user/865'
      end
    end
  end
end
