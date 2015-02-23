require 'jekyll/date_logic'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DateLogic::Before do

  let(:now) { Time.now }
  let(:past) { now - 1 }
  let(:future) { now + 1 }
  let(:before) { Jekyll::DateLogic::Before }

  before(:each) { Jekyll::DateLogic::Clock.stubs(:now).returns(now) }

  it 'shows content if time is not found' do
    assert before.show_content?(nil)
  end

  it 'shows content if time is in the future' do
    assert before.show_content?(future)
  end

  it 'does not show content if time is now' do
    refute before.show_content?(now)
  end

  it 'does not show content if time is in the past' do
    refute before.show_content?(past)
  end

end
