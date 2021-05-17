# frozen_string_literal: true

module GitHubOpenApiWrapper
  class User
    def self.path user
      case user
      when String
        "users/#{user}"
      when Integer
        "user/#{user}"
      else
        "user"
      end
    end
  end
end
