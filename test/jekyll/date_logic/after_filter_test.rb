require 'jekyll/date_logic'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DateLogic::AfterFilter do
  let(:after_filter) { Object.new.extend(Jekyll::DateLogic::AfterFilter) }
  let(:past_data) { [ { 'the_date' => '2005-01-23 00:00:00 -0600' } ] }
  let(:future_data) { [ { 'the_date' => '2025-01-23 00:00:00 -0600' } ] }

  describe 'keep item' do
    it 'if date in the past' do
      data = after_filter.after(past_data, 'the_date')
      assert_equal 1, data.length
    end
  end

  describe 'remove item' do
    it 'if date is in the future' do
      data = after_filter.after(future_data, 'the_date')
      assert_equal 0, data.length
    end
  end
end
