require_relative 'automated_init'

context "Test Session" do
  fixture = Controls::Fixture.example

  context "Get" do
    session = fixture.test_session

    comment session.class.name

    test "Substitute session" do
      assert(session.instance_of?(Session::Substitute::Session))
    end
  end

  context "Set" do
    control_session = Session.new
    fixture.test_session = control_session

    session = fixture.test_session

    comment session.class.name

    test "Substitute session" do
      assert(session == control_session)
    end
  end
end
