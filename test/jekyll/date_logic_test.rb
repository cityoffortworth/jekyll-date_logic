require 'jekyll/date_logic'
require 'minitest/autorun'
require 'mocha/mini_test'

describe Jekyll::DateLogic do
  let(:now) { Time.now }
  let(:five_hours) { 5 * 60 * 60}
  let(:five_hours_ago) { now - five_hours}
  let(:five_hours_from_now) { now + five_hours }
  before(:each) { Jekyll::DateLogic::Clock.stubs(:now).returns(now) }

  describe 'After' do
    let(:after) { Jekyll::DateLogic::After }

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


  describe 'Before' do
    let(:before) { Jekyll::DateLogic::Before }

    describe 'shows content' do
      it 'if time is not found' do
        assert before.show_content?(nil)
      end

      it 'if time is in the future' do
        assert before.show_content?(five_hours_from_now)
      end

      # it 'if time - for_hours is in the past' do
      #   assert before.show_content?(five_hours_from_now, 6)
      # end
    end

    describe 'does not show content' do
      it 'if time is now' do
        refute before.show_content?(now)
      end

      it 'if time is in the past' do
        refute before.show_content?(five_hours_ago)
      end

      # it 'if time - for_hours is in the future' do
      #   refute before.show_content?(five_hours_from_now, 4)
      # end
    end
  end

end
