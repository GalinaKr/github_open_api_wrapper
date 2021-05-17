# frozen_string_literal: true

module GithubOpenApiWrapper
  class RepoArguments < Arguments
    attr_reader :repo

    def initialize(args)
      arguments = super(args)
      @repo = arguments.shift

      arguments
    end
  end
end
