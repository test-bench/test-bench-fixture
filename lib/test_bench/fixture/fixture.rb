module TestBench
  module Fixture
    def test_session
      @test_session ||= Session::Substitute.build
    end
    attr_writer :test_session

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
