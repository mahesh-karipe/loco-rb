module LocoRb
  module Api
    module Import
      PATH = 'import'

      def import_locale(options={ext: 'json', index: 'id'})
        opts = {}
        opts[:params] = { locale: options[:locale] } if options.dig( :locale)
        response = post("#{PATH}/#{options[:ext]}", opts)
        LocoRb::Resource::Locale.new(response.data, response.headers, 'locale').table
      end
    end
  end
end
