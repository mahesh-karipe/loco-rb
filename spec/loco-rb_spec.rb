require 'spec_helper'

require 'loco-rb'
describe LocoRb do
  describe '#configure' do
    let(:api_key) { 'some_key' }
    let(:locale_paths) { ['some/path'] }
    it 'should set api_key' do
      described_class.configure do |config|
        config.api_key = api_key
        expect(described_class.configuration.api_key).to eql(api_key)
      end
    end

    it 'should set locale_paths' do
      described_class.configure do |config|
        config.locale_paths = locale_paths
        expect(described_class.configuration.locale_paths).to eql(locale_paths)
      end
    end
  end
end
