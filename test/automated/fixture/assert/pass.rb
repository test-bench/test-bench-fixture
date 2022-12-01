require_relative '../../automated_init'

context "Fixture" do
  context "Assert" do
    context "Pass" do
      fixture = Controls::Fixture.example

      result = Controls::Result.pass

      fixture.assert(result)

      test "Asserted" do
        assert(fixture.test_session.asserted?)
      end
    end
  end
end
