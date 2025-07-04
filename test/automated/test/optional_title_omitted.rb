require_relative '../automated_init'

context "Test" do
  context "Optional Title Omitted" do
    fixture = Controls::Fixture.example

    fixture.test {}

    context "Test Finished Event" do
      test_finished = fixture.test_session.one_test_finished_event

      test! "Recorded" do
        refute(test_finished.nil?)
      end

      context "Title Attribute" do
        title = test_finished.title

        detail title.inspect

        test "Not set" do
          assert(title.nil?)
        end
      end
    end
  end
end
