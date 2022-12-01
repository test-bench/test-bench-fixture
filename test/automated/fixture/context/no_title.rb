require_relative '../../automated_init'

context "Fixture" do
  context "Context" do
    context "No Title" do
      context "Pass" do
        fixture = Controls::Fixture.example

        fixture.context do
          #
        end

        context "Telemetry" do
          telemetry = fixture.test_session.telemetry

          context "Context Finished" do
            context_finished = telemetry.one_event(Session::Events::ContextFinished)

            test! do
              refute(context_finished.nil?)
            end

            context "Result" do
              result = context_finished.result
              control_result = Controls::Result.pass

              comment result.inspect
              detail "Control: #{control_result.inspect}"

              test do
                assert(result == control_result)
              end
            end
          end
        end
      end

      context "Failure" do
        fixture = Controls::Fixture.example

        fixture.context do
          fixture.fail!
        end

        context "Telemetry" do
          telemetry = fixture.test_session.telemetry

          context "Context Finished" do
            context_finished = telemetry.one_event(Session::Events::ContextFinished)

            test! do
              refute(context_finished.nil?)
            end

            context "Result" do
              result = context_finished.result
              control_result = Controls::Result.failure

              comment result.inspect
              detail "Control: #{control_result.inspect}"

              test do
                assert(result == control_result)
              end
            end
          end
        end
      end
    end
  end
end
