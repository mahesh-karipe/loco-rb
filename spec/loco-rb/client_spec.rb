require 'spec_helper'
require 'faraday'
require 'loco-rb'
require 'loco-rb/configuration'
require 'loco-rb/client'
require 'loco-rb/resource'

describe LocoRb::Client do
  let(:stubs)  { Faraday::Adapter::Test::Stubs.new }
  let(:conn)   { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:client) { described_class.new }

  before do
    allow(Faraday).to receive(:new).and_return(conn)
  end

  describe '#get_locale' do
    let(:path) { '/api/locales/uk' }
    let(:locale_response) { File.read('spec/fixtures/locales/get_uk.json') }

    subject(:get_locale) { client.get_locale({code: 'uk'})}

    before do
      stubs.get(path) do
        [
          200,
          { 'Content-Type': 'application/json' },
          locale_response
        ]
      end
    end

    it 'sends get request via Faraday' do
      expect(client).to receive(:get_locale).and_return(an_instance_of(LocoRb::Resource::Locale))
      get_locale
    end
  end

  describe '#create_locale' do
    let(:path) { '/api/locales' }
    let(:locale_response) { File.read('spec/fixtures/locales/get_uk.json') }

    subject(:create_locale) { client.create_locale({code: 'uk'})}

    before do
      stubs.post(path) do
        [
          200,
          { 'Content-Type': 'application/json' },
          locale_response
        ]
      end
    end

    it 'sends post request via Faraday' do
      expect(client).to receive(:create_locale).and_return(an_instance_of(LocoRb::Resource::Locale))
      create_locale
    end
  end

  describe '#export_locale' do
    let(:path) { '/api/export/locale/uk.json' }
    let(:export_response) { File.read('spec/fixtures/locales/export.json') }

    subject(:export_locale) { client.export_locale({locale: 'uk', ext: 'json'})}

    before do
      stubs.get(path) do
        [
          200,
          { 'Content-Type': 'application/json' },
          export_response
        ]
      end
    end

    it 'sends get request via Faraday' do
      expect(client).to receive(:export_locale).and_return(an_instance_of(LocoRb::Resource::Locale))
      export_locale
    end
  end

  describe '#import_locale' do
    let(:path) { '/api/import/json?locale=uk' }
    let(:import_response) { File.read('spec/fixtures/locales/import.json') }

    subject(:import_locale) { client.import_locale({locale: 'uk', ext: 'json', path: 'spec/fixtures/locales/export.json'})}

    before do
      stubs.post(path) do
        [
          200,
          { 'Content-Type': 'application/json' },
          import_response
        ]
      end
    end

    it 'sends post request via Faraday' do
      expect(client).to receive(:import_locale).and_return(an_instance_of(LocoRb::Resource::Import))
      import_locale
    end
  end
end