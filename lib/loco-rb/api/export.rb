module LocoRb
  module Api
    module Export
      PATH = 'export'

      def export_locale(options={locale: 'en', ext: 'json'})
        response = get("#{PATH}/locale/#{options[:locale]}.#{options[:ext]}")
        LocoRb::Resource::Locale.new(response.data, response.headers, 'locale').table
      end
    end
  end
end
