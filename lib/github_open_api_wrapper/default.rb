# frozen_string_literal: true

require 'github_open_api_wrapper/response/raise_error'
require 'github_open_api_wrapper/response/feed_parser'
require 'github_open_api_wrapper/version'

module GitHubOpenApiWrapper
  module Default
    API_ENDPOINT = "https://api.github.com".freeze

    USER_AGENT   = "GitHubOpenApiWrapper Ruby Gem #{GitHubOpenApiWrapper::VERSION}".freeze

    WEB_ENDPOINT = "https://github.com".freeze

    class << self
      def options
        Hash[GithubOpenApiWrapper::Configurable.keys.map{|key| [key, send(key)]}]
      end

      def access_token
        ENV['ACCESS_TOKEN']
      end

      def api_endpoint
        ENV['API_ENDPOINT'] || API_ENDPOINT
      end

      def auto_paginate
        ENV['AUTO_PAGINATE']
      end

      # Default OAuth app key from ENV
      # @return [String]
      def client_id
        ENV['CLIENT_ID']
      end

      def client_secret
        ENV['SECRET']
      end

      def login
        ENV['LOGIN']
      end

      def password
        ENV['PASSWORD']
      end

      def per_page
        page_size = ENV['PER_PAGE']

        page_size.to_i if page_size
      end

      def user_agent
        ENV['USER_AGENT'] || USER_AGENT
      end

      def web_endpoint
        ENV['WEB_ENDPOINT'] || WEB_ENDPOINT
      end

      def netrc
        ENV['NETRC'] || false
      end

      def netrc_file
        ENV['NETRC_FILE'] || File.join(ENV['HOME'].to_s, '.netrc')
      end

    end
  end
end
