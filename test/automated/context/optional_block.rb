require_relative '../automated_init'

context "Context" do
  context "Optional Block Argument" do
    context_title = Controls::Title::Context.example

    context "Given" do
      fixture = Controls::Fixture.example

      fixture.context(context_title) {}

      context "Skipped Event" do
        recorded = fixture.test_session.skipped_event?

        test "Not recorded" do
          refute(recorded)
        end
      end

      context "Context Finished Event" do
        recorded = fixture.test_session.context_finished_event?

        test "Recorded" do
          assert(recorded)
        end
      end
    end

    context "Omitted" do
      fixture = Controls::Fixture.example

      fixture.context(context_title)

      context "Skipped Event" do
        skipped = fixture.test_session.one_skipped_event

        test! "Recorded" do
          refute(skipped.nil?)
        end

        context "Message Attribute" do
          message = skipped.message

          comment message.inspect
          detail "Title: #{context_title.inspect}"

          test "Is the context title" do
            assert(message == context_title)
          end
        end
      end

      context "Context Finished Event" do
        recorded = fixture.test_session.context_finished_event?

        test "Not recorded" do
          refute(recorded)
        end
      end
    end
  end
end
