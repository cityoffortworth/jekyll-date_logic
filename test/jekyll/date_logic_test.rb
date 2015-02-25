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

    filename = File.join('_site', 'test.html')
    contents = File.read(filename)

    assert contents.scan(/(?=success)/).count == 4, "Expected 4 success outputs"
    assert contents.scan(/(?=failure)/).count == 0, "Expected 0 failure outputs"
  end

end
