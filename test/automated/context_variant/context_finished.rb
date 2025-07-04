require_relative '../automated_init'

context "Context Variant" do
  context "Context Finished" do
    control_title = Controls::Title.example

    fixture = Controls::Fixture.example

    catch(Session::ExecutionBreak) do
      fixture.context!(Controls::Title.example) {}
    end

    context "Context Finished Event" do
      context_finished = fixture.test_session.one_context_finished_event

      test! "Recorded" do
        refute(context_finished.nil?)
      end

      context "Title Attribute" do
        title = context_finished.title

        comment title.inspect
        detail "Control: #{control_title.inspect}"

        test do
          assert(title == control_title)
        end
      end
    end
  end
end
