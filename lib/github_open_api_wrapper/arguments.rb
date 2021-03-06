# frozen_string_literal: true

module GithubOpenApiWrapper
  class Arguments < Array
    attr_reader :options

    def initialize(args)
      @options = args.last.is_a?(::Hash) ? args.pop : {}
      super(args)
    end
  end
end
