module TestBench
  module Fixture
    def test_session
      @test_session ||= Session::Substitute.build
    end
    attr_writer :test_session
  end
end
