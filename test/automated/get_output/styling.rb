require_relative '../automated_init'

context "Get Output" do
  context "Styling" do
    context "Enabled (default)" do
      fixture = Controls::Fixture.example

      fixture.context "Some Context" do
        #
      end

      context "Output" do
        output = Fixture.output(fixture)
        control_output = <<~TEXT
        \e[32mSome Context\e[0m
        \e[0m
        TEXT

        comment output
        detail "Control:", control_output

        test do
          assert(output == control_output)
        end
      end
    end

    context "Disabled" do
      styling = false

      fixture = Controls::Fixture.example

      fixture.context "Some Context" do
        #
      end

      context "Output" do
        output = Fixture.output(fixture, styling:)
        control_output = <<~TEXT
        Some Context

        TEXT

        comment output
        detail "Control:", control_output

        test do
          assert(output == control_output)
        end
      end
    end
  end
end
