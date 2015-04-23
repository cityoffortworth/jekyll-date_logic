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

  describe 'check that' do

    let(:contents) do
      site.process
      filename = File.join('_site', 'test.html')
      File.read(filename)
    end

    it 'should output success messages' do
      assert_equal 4, contents.scan(/(?=block success)/).count
    end

    it 'should not output failure messages' do
      assert_equal 0, contents.scan(/(?=block failure)/).count
    end

    it 'should output before filter worked messages' do
      assert_equal 3, contents.scan(/(?=before filter worked)/).count
    end

    it 'should output after filter worked messages' do
      assert_equal 2, contents.scan(/(?=after filter worked)/).count
    end

    it 'before for_hours filter works' do
      assert_equal 3, contents.scan(/(?=before for_hours filter success)/).count
      assert_equal 0, contents.scan(/(?=before for_hours filter failure)/).count
    end

    it 'after for_hours filter works' do
      assert_equal 2, contents.scan(/(?=after for_hours filter success)/).count
      assert_equal 0, contents.scan(/(?=after for_hours filter failure)/).count
    end

  end
end
