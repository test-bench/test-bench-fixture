require_relative '../../automated_init'

context "Fixture" do
  context "Refute" do
    context "Failure" do
      output = Controls::Output::Styling.example

      failure = nil

      fixture = Controls::Fixture.(output) do |fixture|
        fixture.refute(true)
      rescue Session::Failure => failure
      end

      test! do
        refute(failure.nil?)
      end

      context "Output" do
        writer = output.writer
        written_text = writer.written_text

        control_text = <<~TEXT
        \e[31mAssertion failed\e[0m
        TEXT

        comment written_text
        detail "Control:", control_text

        test do
          assert(writer.written?(control_text))
        end
      end
    end
  end
end
