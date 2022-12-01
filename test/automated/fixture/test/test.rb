require_relative '../../automated_init'

context "Fixture" do
  context "Test" do
    title = Controls::Title::Test.example

    context "Pass" do
      output = Controls::Output.example

      Controls::Fixture.(output) do |fixture|
        fixture.test title do
          fixture.test_session.record_assertion
        end
      end

      context "Output" do
        written_text = output.writer.written_text
        control_text = <<~TEXT
        #{title}
        TEXT

        comment written_text
        detail "Control:", control_text

        test do
          assert(output.writer.written?(control_text))
        end
      end
    end

    context "Failure" do
      output = Controls::Output.example

      Controls::Fixture.(output) do |fixture|
        fixture.test title do
          fixture.test_session.record_failure
        end
      end

      context "Output" do
        written_text = output.writer.written_text
        control_text = <<~TEXT
        #{title} (failed)
        TEXT

        comment written_text
        detail "Control:", control_text

        test do
          assert(output.writer.written?(control_text))
        end
      end
    end

    context "Skip" do
      output = Controls::Output.example

      Controls::Fixture.(output) do |fixture|
        fixture.test title
      end

      context "Output" do
        written_text = output.writer.written_text
        control_text = <<~TEXT
        #{title} (skipped)
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
