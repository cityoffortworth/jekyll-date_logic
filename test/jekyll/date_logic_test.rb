require 'jekyll/date_logic'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DateLogic do
  let(:config) do
    Jekyll.configuration({
      'source' => 'test/fixtures',
      'quiet' => true
    })
  end

  let(:site) { Jekyll::Site.new(config) }

  it 'successfully builds' do
    site.process
  end
end
