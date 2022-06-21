module LocoRb
  class Configuration

    DEFAULT_ENDPOINT = 'https://localise.biz/api'

    attr_accessor :api_key, :locale_paths

    def initialize
      @api_key = nil
      @locale_paths = []
    end

  end
end