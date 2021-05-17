# frozen_string_literal: true

module GitHubOpenApiWrapper
  class Organization
    def self.path org
      case org
      when String
        "orgs/#{org}"
      when Integer
        "organizations/#{org}"
      end
    end
  end
end
