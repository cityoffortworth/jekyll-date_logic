require 'jekyll/date_logic'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DateLogic::After do

  let(:now) { Time.now }
  let(:five_hours) { 5 * 60 * 60}
  let(:past) { now - five_hours}
  let(:future) { now + five_hours }
  let(:after) { Jekyll::DateLogic::After }

  before(:each) { Jekyll::DateLogic::Clock.stubs(:now).returns(now) }

  it 'shows content if time is not found' do
    assert after.show_content?(nil)
  end

  it 'shows content if time is in the past' do
    assert after.show_content?(past)
  end

  it 'does not show content if time is now' do
    refute after.show_content?(now)
  end

  it 'does not show content if time is in the future' do
    refute after.show_content?(future)
  end

  it 'shows content if time + for_hours is in the future' do
    assert after.show_content?(past, 6)
  end

  it 'does not show content if time + for_hours is in the past' do
    refute after.show_content?(past, 4)
  end

end
