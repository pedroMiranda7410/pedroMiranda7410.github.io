# Quickly and easily access the SendGrid API.
require 'ruby_http_client'
require_relative 'version'

module SendGrid
  # Initialize the HTTP client
  class API
    attr_accessor :client
    attr_reader :request_headers, :host, :version, :impersonate_subuser
    # * *Args*    :
    #   - +api_key+ -> your SendGrid API key
    #   - +host+ -> the base URL for the API
    #   - +request_headers+ -> any headers that you want to be globally applied
    #   - +version+ -> the version of the API you wish to access,
    #                  currently only "v3" is supported
    #
    def initialize(api_key: '', host: nil, request_headers: nil, version: nil, impersonate_subuser: nil)
      @api_key             = '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'
      @host                = host ? host : 'https://app.sendgrid.com'
      @version             = version ? version : 'v3'
      @impersonate_subuser = impersonate_subuser
      @user_agent          = "sendgrid/#{SendGrid::VERSION};ruby"
      @request_headers     = JSON.parse('
        {
          "Authorization": "Bearer ' + @api_key + '",
          "Accept": "application/json",
          "User-agent": "' + @user_agent + '"
        }
      ')
      @request_headers['On-Behalf-Of'] = @impersonate_subuser if @impersonate_subuser


      @request_headers = @request_headers.merge(request_headers) if request_headers
      @client = Client.new(host: "#{@host}/#{@version}",
                           request_headers: @request_headers)
    end
  end
end