# frozen_string_literal: true

RSpec.describe GithubOpenApiWrapper do
  before do
    GithubOpenApiWrapper.reset!
  end

  after do
    GithubOpenApiWrapper.reset!
  end

  it "has a version number" do
    expect(GithubOpenApiWrapper::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  it "sets defaults" do
    GithubOpenApiWrapper::Configurable.keys.each do |key|
      expect(GithubOpenApiWrapper.instance_variable_get(:"@#{key}")).to eq(GithubOpenApiWrapper::Default.send(key))
    end
  end

  describe ".client" do
    it "creates an GithubOpenApiWrapper::Client" do
      expect(GithubOpenApiWrapper.client).to be_kind_of GithubOpenApiWrapper::Client
    end
    it "caches the client when the same options are passed" do
      expect(GithubOpenApiWrapper.client).to eq(GithubOpenApiWrapper.client)
    end
    it "returns a fresh client when options are not the same" do
      client = GithubOpenApiWrapper.client
      GithubOpenApiWrapper.access_token = "87614b09dd141c22800f96f11737ade5226d7ba8"
      client_two = GithubOpenApiWrapper.client
      client_three = GithubOpenApiWrapper.client
      expect(client).not_to eq(client_two)
      expect(client_three).to eq(client_two)
    end
  end

  describe ".configure" do
    GithubOpenApiWrapper::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        GithubOpenApiWrapper.configure do |config|
          config.send("#{key}=", key)
        end
        expect(GithubOpenApiWrapper.instance_variable_get(:"@#{key}")).to eq(key)
      end
    end
  end
end
