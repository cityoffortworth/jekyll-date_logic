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

  describe 'build' do

    let(:contents) do
      site.process
      filename = File.join('_site', 'test.html')
      File.read(filename)
    end

    it 'should output success messages' do
      assert_equal 4, contents.scan(/(?=success)/).count
    end

    it 'should not output failure messages' do
      assert_equal 0, contents.scan(/(?=failure)/).count
    end

    it 'should output before filter worked messages' do
      assert_equal 3, contents.scan(/(?=before filter worked)/).count
    end

    it 'should output after filter worked messages' do
      assert_equal 2, contents.scan(/(?=after filter worked)/).count
    end

  end
end
