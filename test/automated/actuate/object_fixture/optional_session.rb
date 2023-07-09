require_relative '../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Optional Session Argument" do
      context "Given" do
        control_session = Session.new

        object = Controls::Fixture::Object.example

        Fixture::Actuate::Object.(object, session: control_session) do
          #
        end

        context "Object's Session" do
          session = object.test_session

          test "Is the given session" do
            assert(session == control_session)
          end
        end
      end

      context "Omitted" do
        object = Controls::Fixture::Object.example

        Fixture::Actuate::Object.(object) do
          #
        end

        context "Object's Session" do
          session = object.test_session

          test "Configured" do
            assert(session.instance_of?(Session))
          end
        end
      end
    end
  end
end
