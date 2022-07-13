module LocoRb
  module Api
    module Asset
      PATH = 'assets'
      CREATE_PARAMS = %i[id text type context notes default].freeze

      def get_assets(options={})
        opts = {}
        opts[:params] = { filter: options[:filter].join(',') } if options.dig( :filter)
        response = get(PATH, opts)
        response.data.map do |asset|
          LocoRb::Resource::Asset.new(asset, response.headers, 'asset')
        end
      end

      def create_asset(options={})
        opts = {}
        options.each do |key, value|
          if CREATE_PARAMS.include?(key)
            opts[:body] = {} unless opts.key?(:body)
            opts[:body][key] = value
          end
        end
        response = post(PATH, opts)
        LocoRb::Resource::Asset.new(response.data, response.headers, 'asset')
      end
    end
  end
end
