require 'jekyll/date_logic'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DateLogic::BeforeFilter do
  let(:before_filter) { Object.new.extend(Jekyll::DateLogic::BeforeFilter) }
  let(:past_data) { [ { 'the_date' => '2005-01-23 00:00:00 -0600' } ] }
  let(:future_data) { [ { 'the_date' => '2025-01-23 00:00:00 -0600' } ] }

  describe 'keep item' do
    it 'if date is in the future' do
      data = before_filter.before(future_data, 'the_date')
      assert_equal 1, data.length
    end
  end

  describe 'remove item' do
    it 'if date is in the past' do
      data = before_filter.before(past_data, 'the_date')
      assert_equal 0, data.length
    end
  end
end
