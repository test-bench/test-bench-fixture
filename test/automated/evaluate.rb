require_relative 'automated_init'

context "Evaluate" do
  session = Session::Substitute.build

  fixture = Fixture::Evaluate.(session:) do
    comment "Some comment"
    comment "Some other comment"
  end

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
