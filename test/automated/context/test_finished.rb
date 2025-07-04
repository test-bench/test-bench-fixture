require_relative '../automated_init'

context "Context" do
  context "Context Finished" do
    control_title = Controls::Title.example

    fixture = Controls::Fixture.example

    fixture.context(control_title) {}

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
