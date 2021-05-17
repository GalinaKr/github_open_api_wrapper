require 'spec/spec_helper'

describe GithubOpenApiWrapper::Repository do
  context "when passed a string containg a slash" do
    before do
      @repository = GithubOpenApiWrapper::Repository.new("sferik/github_open_api_wrapper")
    end

    it "responds to repo and user" do
      expect(@repository.repo).to eq("github_open_api_wrapper")
      expect(@repository.user).to eq("sferik")
    end

    it "renders slug as string" do
      expect(@repository.slug).to eq("sferik/github_open_api_wrapper")
      expect(@repository.to_s).to eq(@repository.slug)
    end

    it "renders url as string" do
      expect(@repository.url).to eq('https://github.com/sferik/github_open_api_wrapper')
    end
  end

  describe ".path" do
    context "with named repository" do
      it "returns the url path" do
        repository = GithubOpenApiWrapper::Repository.new('sferik/github_open_api_wrapper')
        expect(repository.path).to eq 'repos/sferik/github_open_api_wrapper'
      end
    end

    context "with repository id" do
      it "returns theu url path" do
        repository = GithubOpenApiWrapper::Repository.new(12345)
        expect(repository.path).to eq 'repositories/12345'
      end
    end
  end

  describe "self.path" do
    it "returns the api path" do
      expect(GithubOpenApiWrapper::Repository.path('sferik/github_open_api_wrapper')).to eq 'repos/sferik/github_open_api_wrapper'
      expect(GithubOpenApiWrapper::Repository.path(12345)).to eq 'repositories/12345'
    end
  end

  context "when passed an integer" do
    it "sets the repository id" do
      repository = GithubOpenApiWrapper::Repository.new(12345)
      expect(repository.id).to eq 12345
    end
  end

  context "when passed a hash" do
    it "sets the repository name and username" do
      repository = GithubOpenApiWrapper::Repository.new({:username => 'sferik', :name => 'github_open_api_wrapper'})
      expect(repository.name).to eq("github_open_api_wrapper")
      expect(repository.username).to eq("sferik")
    end
  end

  context "when passed a Repo" do
    it "sets the repository name and username" do
      repository = GithubOpenApiWrapper::Repository.new(GithubOpenApiWrapper::Repository.new('sferik/github_open_api_wrapper'))
      expect(repository.name).to eq("github_open_api_wrapper")
      expect(repository.username).to eq("sferik")
      expect(repository.url).to eq('https://github.com/sferik/github_open_api_wrapper')
    end
  end

  context "when given a URL" do
    it "sets the repository name and username" do
      repository = GithubOpenApiWrapper::Repository.from_url("https://github.com/sferik/github_open_api_wrapper")
      expect(repository.name).to eq("github_open_api_wrapper")
      expect(repository.username).to eq("sferik")
    end
  end
end
