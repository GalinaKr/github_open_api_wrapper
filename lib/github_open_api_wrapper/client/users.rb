# frozen_string_literal: true

module GitHubOpenApiWrapper
  class Client
    module Users
      def user(user=nil, options = {})
        get User.path(user), options
      end
    end
  end
end
