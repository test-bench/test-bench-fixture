require_relative '../automated_init'

context "Fixture" do
  context "Fail" do
    context "No Message" do
      output = Controls::Output::Styling.example

      default_message = Session.default_failure_message

      Controls::Fixture.(output) do |fixture|
        fixture.fail
      rescue Session::Failure
      end

      context "Output" do
        written_text = output.writer.written_text
        control_text = <<~TEXT
        \e[31m#{default_message}\e[0m
        TEXT

        comment written_text
        detail "Control:", control_text

        test do
          assert(output.writer.written?(control_text))
        end
      end
    end

    context "Message" do
      output = Controls::Output::Styling.example

      message = "Some message"

      Controls::Fixture.(output) do |fixture|
        fixture.fail message
      rescue Session::Failure
      end

      context "Output" do
        written_text = output.writer.written_text
        control_text = <<~TEXT
        \e[31m#{message}\e[0m
        TEXT

        comment written_text
        detail "Control:", control_text

        test do
          assert(output.writer.written?(control_text))
        end
      end
    end
  end
end
