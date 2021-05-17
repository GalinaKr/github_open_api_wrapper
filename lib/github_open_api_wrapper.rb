# frozen_string_literal: true

require 'github_open_api_wrapper/client'
require_relative "github_open_api_wrapper/version"

module GithubOpenApiWrapper
  class Error < StandardError; end
  # Your code goes here...
end

GithubOpenApiWrapper.setup
