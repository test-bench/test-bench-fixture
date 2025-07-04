require_relative '../automated_init'

context "Context" do
  context "Result" do
    context "Passed" do
      control_result = true

      fixture = Controls::Fixture.example

      session = fixture.test_session

      result = fixture.context(Controls::Title.example) do
        session.status = Controls::Status::Passed.example
      end

      comment result.inspect
      detail "Control: #{control_result.inspect}"

      test do
        assert(result == control_result)
      end
    end

    context "Failed" do
      control_result = false

      fixture = Controls::Fixture.example

      session = fixture.test_session

      result = fixture.context(Controls::Title.example) do
        session.status = Controls::Status::Failed.example
      end

      comment result.inspect
      detail "Control: #{control_result.inspect}"

      test do
        assert(result == control_result)
      end
    end

    context "Skipped" do
      control_result = nil

      fixture = Controls::Fixture.example

      result = fixture.context(Controls::Title.example)

      comment result.inspect
      detail "Control: #{control_result.inspect}"

      test do
        assert(result == control_result)
      end
    end
  end
end
