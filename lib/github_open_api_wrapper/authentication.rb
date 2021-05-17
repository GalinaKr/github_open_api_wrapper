# frozen_string_literal: true

module GithubOpenApiWrapper
  module Authentication
    def basic_authenticated?
      !!(@login && @password)
    end

    def token_authenticated?
      !!@access_token
    end

    def bearer_authenticated?
      !!@bearer_token
    end

    def user_authenticated?
      basic_authenticated? || token_authenticated?
    end

    def application_authenticated?
      !!(@client_id && @client_secret)
    end

    private

    def login_from_netrc
      return unless netrc?

      require 'netrc'
      info = Netrc.read netrc_file
      netrc_host = URI.parse(api_endpoint).host
      creds = info[netrc_host]
      if creds.nil?
        # creds will be nil if there is no netrc for this end point
        github_open_api_wrapper_warn "Error loading credentials from netrc file for #{api_endpoint}"
      else
        creds = creds.to_a
        self.login = creds.shift
        self.password = creds.shift
      end
    rescue LoadError
      github_open_api_wrapper_warn "Please install netrc gem for .netrc support"
    end

  end
end
