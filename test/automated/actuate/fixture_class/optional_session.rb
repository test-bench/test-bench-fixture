require_relative '../../automated_init'

context "Actuate" do
  context "Fixture Class" do
    context "Optional Session Argument" do
      fixture_class = Controls::Fixture::Example

      context "Given" do
        control_session = Session.new

        fixture = Fixture::Actuate::Class.(fixture_class, session: control_session) do
          #
        end

        context "Fixture's Session" do
          session = fixture.test_session

          test "Is the given session" do
            assert(session == control_session)
          end
        end
      end

      context "Omitted" do
        fixture = Fixture::Actuate::Class.(fixture_class) do
          #
        end

        context "Fixture's Session" do
          session = fixture.test_session

          test "Configured" do
            assert(session.instance_of?(Session))
          end
        end
      end
    end
  end
end
