module LocoRb
  class Configuration

    DEFAULT_ENDPOINT = 'https://localise.biz/api'

    attr_accessor :api_key

    def initialize
      @api_key = nil
    end

  end
end