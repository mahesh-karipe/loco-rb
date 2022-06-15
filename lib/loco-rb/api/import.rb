module LocoRb
  module Api
    module Import
      PATH = 'import'

      def import_locale(options={ext: 'json', index: 'id'})
        opts = {}
        opts[:params] = { locale: options[:locale] } if options.dig( :locale)
        opts[:body] = IO.read(options[:path])
        response = post("#{PATH}/#{options[:ext] || 'json'}", opts)
        LocoRb::Resource::Import.new(response.data, response.headers, 'import')
      end
    end
  end
end
