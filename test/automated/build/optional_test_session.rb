require_relative '../automated_init'

context "Build" do
  context "Optional Test Session" do
    session = Session.new

    fixture = Fixture::Build.(
      Controls::Fixture::Example,
      test_session: session
    )

    context "Test Session" do
      set = fixture.test_session == session

      test "Set" do
        assert(set)
      end
    end
  end
end
