require_relative '../../automated_init'

context "Fixture" do
  context "Refute" do
    context "Nil" do
      fixture = Controls::Fixture.example

      fixture.refute(nil)

      test "Asserted" do
        assert(fixture.test_session.asserted?)
      end
    end
  end
end
