# frozen_string_literal: true

module GitHubOpenApiWrapper
  class Client
    module Organisations
      def organizations(user=nil, options = {})
        paginate "#{User.path user}/orgs", options
      end
    end
  end
end
