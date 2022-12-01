require_relative '../../automated_init'

context "Fixture" do
  context "Context" do
    title = Controls::Title::Context.example

    context "Pass" do
      output = Controls::Output.example

      Controls::Fixture.(output) do |fixture|
        fixture.context title do
          #
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
        fixture.context title do
          fixture.fail "Some failure"
        end
      end

      context "Output" do
        written_text = output.writer.written_text
        control_text = <<~TEXT
        #{title}
          Some failure

        Failure: 1

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
        fixture.context title
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
