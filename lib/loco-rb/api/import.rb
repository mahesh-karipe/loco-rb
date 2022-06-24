module LocoRb
  module Api
    module Import
      PATH = 'import'

      def import_locale(options={ext: 'json'})
        opts = {}
        opts[:params] = { locale: options[:locale] } if options.dig( :locale)
        opts[:params] = opts[:params].merge({ "tag-updated": options[:tag_updated] }) if options.dig( :tag_updated)
        opts[:body] = IO.read(options[:path])
        response = post("#{PATH}/#{options[:ext] || 'json'}", opts)
        LocoRb::Resource::Import.new(response.data, response.headers, 'import')
      end
    end
  end
end
