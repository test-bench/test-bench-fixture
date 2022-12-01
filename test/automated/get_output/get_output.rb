require_relative '../automated_init'

context "Get Output" do
  fixture = Controls::Fixture.example

  fixture.comment "Some comment"
  fixture.comment "Some other comment"

  context "Output" do
    output = Fixture.output(fixture, styling: false)
    control_output = <<~TEXT
    Some comment
    Some other comment
    TEXT

    comment output
    detail "Control:", control_output

    test do
      assert(output == control_output)
    end
  end
end
