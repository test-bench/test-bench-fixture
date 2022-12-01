require_relative '../../automated_init'

context "Fixture" do
  context "Comment" do
    context "Heading" do
      context "Quoted" do
        output = Controls::Output.example

        Controls::Fixture.(output) do |fixture|
          fixture.comment "Heading 1:", "Line 1\n", "Line 2\n"
          fixture.comment "Heading 2:", "Line 3", "Line 4", quote: true
          fixture.comment "Heading 3:\n", "Line 5\n", "Line 6\n", heading: true
          fixture.comment "Heading 4:\n", "Line 7", "Line 8", heading: true, quote: true
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

          comment written_text
          detail "Control:", control_text

          test do
            assert(output.writer.written?(control_text))
          end
        end
      end

      context "Not Quoted" do
        output = Controls::Output.example

        Controls::Fixture.(output) do |fixture|
          fixture.comment "Heading 1:", "Line 1", "Line 2", heading: true
          fixture.comment "Heading 2:", "Line 3\n", "Line 4\n", heading: true, quote: false
          fixture.comment "Heading 3:\n", "Line 5", "Line 6", heading: true
          fixture.comment "Heading 4:\n", "Line 7\n", "Line 8\n", heading: true, quote: false
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

          comment written_text
          detail "Control:", control_text

          test do
            assert(output.writer.written?(control_text))
          end
        end
      end

      context "Not Text" do
        object = Object.new

        fixture = Controls::Fixture.example

        test "Is a NoMethodError" do
          assert_raises(NoMethodError, "undefined method `to_str' for #{object.inspect}") do
            fixture.comment "Some text", object, heading: true
          end
        end
      end
    end
  end
end
