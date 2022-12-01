require_relative '../../automated_init'

context "Fixture" do
  context "Test" do
    context "No Title" do
      context "Pass" do
        fixture = Controls::Fixture.example

        fixture.test do
          fixture.test_session.record_assertion
        end

        context "Telemetry" do
          telemetry = fixture.test_session.telemetry

          context "Test Finished" do
            test_finished = telemetry.one_event(Session::Events::TestFinished)

            test! do
              refute(test_finished.nil?)
            end

            context "Result" do
              result = test_finished.result
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

        fixture.test do
          fixture.fail
        end

        context "Telemetry" do
          telemetry = fixture.test_session.telemetry

          context "Test Finished" do
            test_finished = telemetry.one_event(Session::Events::TestFinished)

            test! do
              refute(test_finished.nil?)
            end

            context "Result" do
              result = test_finished.result
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
