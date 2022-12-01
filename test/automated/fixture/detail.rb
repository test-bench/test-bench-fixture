require_relative '../automated_init'

context "Fixture" do
  context "Detail" do
    context "Heading" do
      context "Quoted" do
        output = Controls::Output.example

        Controls::Fixture.(output) do |fixture|
          fixture.detail "Heading 1:", "Line 1\n", "Line 2\n"
          fixture.detail "Heading 2:", "Line 3", "Line 4", quote: true
          fixture.detail "Heading 3:\n", "Line 5\n", "Line 6\n", heading: true
          fixture.detail "Heading 4:\n", "Line 7", "Line 8", heading: true, quote: true
        end

        context "Output" do
          written_text = output.writer.written_text
          control_text = <<~TEXT
          Heading 1:
          - - -
          > Line 1
          > Line 2
          Heading 2:
          - - -
          > Line 3Line 4
          Heading 3:
          - - -
          > Line 5
          > Line 6
          Heading 4:
          - - -
          > Line 7Line 8
          TEXT

          detail written_text
          detail "Control:", control_text

          test do
            assert(output.writer.written?(control_text))
          end
        end
      end

      context "Not Quoted" do
        output = Controls::Output.example

        Controls::Fixture.(output) do |fixture|
          fixture.detail "Heading 1:", "Line 1", "Line 2", heading: true
          fixture.detail "Heading 2:", "Line 3\n", "Line 4\n", heading: true, quote: false
          fixture.detail "Heading 3:\n", "Line 5", "Line 6", heading: true
          fixture.detail "Heading 4:\n", "Line 7\n", "Line 8\n", heading: true, quote: false
        end

        context "Output" do
          written_text = output.writer.written_text
          control_text = <<~TEXT
          Heading 1:
          - - -
          Line 1
          Line 2
          Heading 2:
          - - -
          Line 3
          Line 4
          Heading 3:
          - - -
          Line 5
          Line 6
          Heading 4:
          - - -
          Line 7
          Line 8
          TEXT

          detail written_text
          detail "Control:", control_text

          test do
            assert(output.writer.written?(control_text))
          end
        end
      end
    end

    context "No Heading" do
      context "Quoted" do
        output = Controls::Output.example

        Controls::Fixture.(output) do |fixture|
          fixture.detail "Line 1\n", "Line 2\n", "Line 3\n"
          fixture.detail "Line 4", "Line 5\n", "Line 6\n", heading: false
          fixture.detail "Line 7", "Line 8", "Line 9", quote: true, heading: false
        end

        context "Output" do
          written_text = output.writer.written_text
          control_text = <<~TEXT
          > Line 1
          > Line 2
          > Line 3
          > Line 4Line 5
          > Line 6
          > Line 7Line 8Line 9
          TEXT

          detail written_text
          detail "Control:", control_text

          test do
            assert(output.writer.written?(control_text))
          end
        end
      end

      context "Not Quoted" do
        output = Controls::Output.example

        Controls::Fixture.(output) do |fixture|
          fixture.detail "Line 1", "Line 2", "Line 3"
          fixture.detail "Line 4\n", "Line 5\n", "Line 6\n", quote: false
          fixture.detail "Line 7", "Line 8\n", "Line 9\n", heading: false, quote: false
        end

        context "Output" do
          written_text = output.writer.written_text
          control_text = <<~TEXT
          Line 1
          Line 2
          Line 3
          Line 4
          Line 5
          Line 6
          Line 7
          Line 8
          Line 9
          TEXT

          detail written_text
          detail "Control:", control_text

          test do
            assert(output.writer.written?(control_text))
          end
        end
      end
    end
  end
end
