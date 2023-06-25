require_relative '../automated_init'

context "Fixture" do
  context "Passed Predicate" do
    context "Passed" do
      fixture = Controls::Fixture.example

      fixture.test_session.record_assertion

      passed = fixture.passed?

      test do
        assert(passed)
      end
    end

    context "Not Passed" do
      fixture = Controls::Fixture.example

      passed = fixture.passed?

      test do
        refute(passed)
      end
    end
  end
end
