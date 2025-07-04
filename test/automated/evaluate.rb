require_relative 'automated_init'

context "Evaluate" do
  test_session = Session::Substitute.build

  Evaluate.(test_session:) do
    comment "Some comment"
    comment "Some other comment"
  end

  context "Output" do
    output = Output::Get.(test_session)

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
