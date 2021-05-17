# frozen_string_literal: true

require 'github_open_api_wrapper/arguments'
require 'github_open_api_wrapper/repo_arguments'
require 'github_open_api_wrapper/configurable'
require 'github_open_api_wrapper/authentication'
require 'github_open_api_wrapper/connection'
require 'github_open_api_wrapper/user'
require 'github_open_api_wrapper/reopsitory'
require 'github_open_api_wrapper/organization'
require 'github_open_api_wrapper/client/users'
require 'github_open_api_wrapper/client/repositories'
require 'github_open_api_wrapper/client/organizations'

module GitHubOpenApiWrapper
  class Client
    include GitHubOpenApiWrapper::Authentication
    include GitHubOpenApiWrapper::Configurable
    include GitHubOpenApiWrapper::Connection
    include GitHubOpenApiWrapper::Client::Users
    include GitHubOpenApiWrapper::Client::Repositories
    include GitHubOpenApiWrapper::Client::Organizations

    # Header keys that can be passed in options hash to {#get},{#head}
    CONVENIENCE_HEADERS = Set.new([:accept, :content_type])

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      GithubOpenApiWrapper::Configurable.keys.each do |key|
        value = options.key?(key) ? options[key] : GithubOpenApiWrapper.instance_variable_get(:"@#{key}")
        instance_variable_set(:"@#{key}", value)
      end

      login_from_netrc unless user_authenticated? || application_authenticated?
    end

    def inspect
      inspected = super

      # mask password
      inspected.gsub! @password, '*******' if @password
      inspected.gsub! @management_console_password, '*******' if @management_console_password
      inspected.gsub! @bearer_token, '********' if @bearer_token
      # Only show last 4 of token, secret
      inspected.gsub! @access_token, "#{'*'*36}#{@access_token[36..-1]}" if @access_token
      inspected.gsub! @client_secret, "#{'*'*36}#{@client_secret[36..-1]}" if @client_secret

      inspected
    end

    def as_app(key = client_id, secret = client_secret, &block)
      if key.to_s.empty? || secret.to_s.empty?
        raise ApplicationCredentialsRequired, "client_id and client_secret required"
      end
      app_client = self.dup
      app_client.client_id = app_client.client_secret = nil
      app_client.login    = key
      app_client.password = secret

      yield app_client if block_given?
    end

    def login=(value)
      reset_agent
      @login = value
    end

    def password=(value)
      reset_agent
      @password = value
    end

    def access_token=(value)
      reset_agent
      @access_token = value
    end

    def bearer_token=(value)
      reset_agent
      @bearer_token = value
    end

    def client_id=(value)
      reset_agent
      @client_id = value
    end

    def client_secret=(value)
      reset_agent
      @client_secret = value
    end

  end
end
