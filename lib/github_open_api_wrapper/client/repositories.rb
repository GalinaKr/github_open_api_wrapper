# frozen_string_literal: true

module GitHubOpenApiWrapper
  class Client
    module Repositories
      def repositories(user=nil, options = {})
        paginate "#{User.path user}/repos", options
      end
    end
  end
end
