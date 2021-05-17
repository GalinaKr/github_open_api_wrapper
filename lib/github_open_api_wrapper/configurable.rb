# frozen_string_literal: true

module GithubOpenApiWrapper
  module Configurable
    attr_accessor :access_token, :auto_paginate, :bearer_token, :client_id,
                  :client_secret, :default_media_type, :connection_options,
                  :middleware, :netrc, :netrc_file,
                  :per_page, :proxy, :ssl_verify_mode, :user_agent
    attr_writer :password, :web_endpoint, :api_endpoint, :login,
                :management_console_endpoint, :management_console_password

    class << self
      def keys
        @keys ||= [
          :access_token,
          :api_endpoint,
          :auto_paginate,
          :bearer_token,
          :client_id,
          :client_secret,
          :connection_options,
          :default_media_type,
          :login,
          :management_console_endpoint,
          :management_console_password,
          :middleware,
          :netrc,
          :netrc_file,
          :per_page,
          :password,
          :proxy,
          :ssl_verify_mode,
          :user_agent,
          :web_endpoint
        ]
      end
    end

    def configure
      yield self
    end

    def reset!
      GithubOpenApiWrapper::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", GithubOpenApiWrapper::Default.options[key])
      end
      self
    end
    alias setup reset!

    def same_options?(opts)
      opts.hash == options.hash
    end

    def api_endpoint
      File.join(@api_endpoint, "")
    end

    def management_console_endpoint
      File.join(@management_console_endpoint, "")
    end

    def web_endpoint
      File.join(@web_endpoint, "")
    end

    def login
      @login ||= begin
                   user.login if token_authenticated?
                 end
    end

    def netrc?
      !!@netrc
    end

    private

    def options
      Hash[GithubOpenApiWrapper::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

    def fetch_client_id_and_secret(overrides = {})
      opts = options.merge(overrides)
      opts.values_at :client_id, :client_secret
    end
  end
end
