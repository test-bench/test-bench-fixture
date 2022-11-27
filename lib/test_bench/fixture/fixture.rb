module TestBench
  module Fixture
    include TestBench::Session::Events

    def test_session
      @test_session ||= Session::Substitute.build
    end
    attr_writer :test_session

    def comment(...)
      Fixture.comment(test_session.telemetry, Commented, ...)
    end

    def detail(...)
      Fixture.comment(test_session.telemetry, Detailed, ...)
    end

    def assert(result)
      if not [true, false, nil].include?(result)
        raise TypeError, "Value #{result.inspect} isn't a boolean"
      end

      result = false if result.nil?

      test_session.assert(result)
    end

    def refute(result)
      if not [true, false, nil].include?(result)
        raise TypeError, "Value #{result.inspect} isn't a boolean"
      end

      negated_result = !result

      test_session.assert(negated_result)
    end

    def self.comment(telemetry, event_class, text, *additional_texts, heading: nil, quote: nil)
      texts = [text, *additional_texts]

      if quote.nil?
        quote = texts.last.end_with?("\n")
      end

      if quote
        if heading.nil?
          heading = !text.end_with?("\n")
        end
      end

      if heading
        heading = texts.shift
      else
        heading = nil
      end

      if quote
        text = texts.join
      else
        text = texts.first
      end

      event = event_class.new
      event.text = text
      event.quote = quote
      event.heading = heading

      telemetry.record(event)

      if not quote
        texts[1..-1].each do |text|
          comment(telemetry, event_class, text, heading: false, quote: false)
        end
      end
    end

    def self.call(fixture_class_or_object, ...)
      if fixture_class_or_object.instance_of?(Class)
        fixture_class = fixture_class_or_object
        Actuate::Class.(fixture_class, ...)
      else
        object = fixture_class_or_object
        Actuate::Object.(object, ...)
      end
    end
  end
end
