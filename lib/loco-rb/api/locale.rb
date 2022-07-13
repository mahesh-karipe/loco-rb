module LocoRb
  module Api
    module Locale
      PATH = 'locales'
      CREATE_PARAMS = %i[code].freeze

      def create_locale(options={})
        opts = {}
        options.each do |key, value|
          if CREATE_PARAMS.include?(key)
            opts[:body] = {} unless opts.key?(:body)
            opts[:body][key] = value
          end
        end
        response = post(PATH, opts)
        LocoRb::Resource::Locale.new(response.data, response.headers, 'locale')
      end

      def get_locale(options={code: 'en'})
        response = get("#{PATH}/#{options[:code]}")
        LocoRb::Resource::Locale.new(response.data, response.headers, 'locale')
      end
    end
  end
end
