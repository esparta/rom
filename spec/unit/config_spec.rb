require 'spec_helper'

describe ROM::Config do
  describe '.build' do
    let(:raw_config) do
      { adapter: 'memory', hostname: 'localhost', database: 'test' }
    end

    it 'returns rom repository configuration hash' do
      config = ROM::Config.build(raw_config)

      expect(config).to eql(default: 'memory://localhost/test')
    end

    it 'asks adapters to normalize scheme' do
      expect(ROM::Adapter[:memory]).to receive(:normalize_scheme).with('memory')
      ROM::Config.build(raw_config)
    end
  end
end
