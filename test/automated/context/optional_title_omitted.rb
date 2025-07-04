require_relative '../automated_init'

context "Context" do
  context "Optional Title Omitted" do
    fixture = Controls::Fixture.example

    fixture.context {}

    context "Context Finished Event" do
      context_finished = fixture.test_session.one_context_finished_event

      test! "Recorded" do
        refute(context_finished.nil?)
      end

      context "Title Attribute" do
        title = context_finished.title

        detail title.inspect

        test "Not set" do
          assert(title.nil?)
        end
      end
    end
  end
end
