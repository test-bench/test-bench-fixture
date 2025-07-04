require_relative '../automated_init'

context "Test" do
  context "Test Finished" do
    control_title = Controls::Title.example

    fixture = Controls::Fixture.example

    fixture.test(control_title) {}

    context "Test Finished Event" do
      test_finished = fixture.test_session.one_test_finished_event

      test! "Recorded" do
        refute(test_finished.nil?)
      end

      context "Title Attribute" do
        title = test_finished.title

        comment title.inspect
        detail "Control: #{control_title.inspect}"

        test do
          assert(title == control_title)
        end
      end
    end
  end
end
