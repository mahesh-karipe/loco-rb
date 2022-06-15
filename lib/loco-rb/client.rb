require 'faraday'
require 'json'
require 'ostruct'
require 'loco-rb/resource'
require 'loco-rb/api'

module LocoRb
  class Client
    include LocoRb::Api::Asset
    include LocoRb::Api::Locale
    include LocoRb::Api::Export
    include LocoRb::Api::Import

    FILE_FORMAT = %w[application/pdf application/zip]

    attr_accessor :options

    def initialize(options={})
      @options = options
    end

    def get(path, options={})
      request_method(path, :get, options)
    end

    def post(path, options={})
      request_method(path, :post, options)
    end

    def put(path, options={})
      request_method(path, :put, options)
    end

    def delete(path, options={})
      request_method(path, :delete, options)
    end

    private

    def request_method(path, method_verb, options={})
      response = request(path, method_verb, options)
      validate(response)
      parsed_response = parse(response)
      OpenStruct.new({ headers: response.headers, data: parsed_response })
    end

    def request(path, method_verb, options={})
      make_connection.send(method_verb) do |request|
        request.url(path)
        request.headers["Authorization"] = "Loco #{LocoRb.configuration.api_key}"
        request.params = options[:params] if options[:params]
        request.body = options[:body] if options[:body]
      end
    end

    def make_connection
      Faraday.new(url: LocoRb::Configuration::DEFAULT_ENDPOINT)
    end

    def validate(response)
      raise LocoRb::Error.new(response.body) if response.status >= 400
    end

    def parse(response)
      return response.body if FILE_FORMAT.include?(response['content-type'])
      return {} if response.body.strip.empty?

      JSON.parse(response.body.strip)
    end
  end
end

