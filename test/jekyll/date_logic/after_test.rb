require 'jekyll/date_logic'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DateLogic::After do
  let(:now) { Time.now }
  let(:five_hours) { 5 * 60 * 60}
  let(:five_hours_ago) { now - five_hours}
  let(:five_hours_from_now) { now + five_hours }

  before(:each) { Jekyll::DateLogic::Clock.stubs(:now).returns(now) }

  let(:after) { Object.new.extend(Jekyll::DateLogic::After) }

  describe 'shows content' do
    it 'if time variable not found' do
      assert after.show_content?(nil)
    end

    it 'if time passed is in the past' do
      assert after.show_content?(five_hours_ago)
    end

    it 'if time passed + for_hours is in the future' do
      assert after.show_content?(five_hours_ago, 6)
    end
  end

  describe 'does not show content' do
    it 'if time is now' do
      refute after.show_content?(now)
    end

    it 'if time is in the future' do
      refute after.show_content?(five_hours_from_now)
    end

    it 'if time + for_hours is in the past' do
      refute after.show_content?(five_hours_ago, 4)
    end
  end
end
