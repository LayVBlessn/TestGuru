# frozen_string_literal: true

module TestPassagesHelper

  def test_time
    time_on_test = (@test_passage.test.timer_value * 60 - (Time.current - @test_passage.created_at).seconds).round
    hours = time_on_test / 3600
    minutes = (time_on_test / 60) % 60
    seconds = time_on_test % 60
    if (hours >= 0 && minutes >= 0 && seconds >= 0)
      { hours: hours, minutes: minutes, seconds: seconds }
    else
      { hours: 0, minutes: 0, seconds: 0 }
    end
  end
end
