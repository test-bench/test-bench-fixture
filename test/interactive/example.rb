require_relative '../../init'

result = ENV.fetch('RESULT', 'pass') == 'pass'

TestBench::Fixture::Evaluate.() do
  context "Some Context" do
    comment_sequence_length = ENV.fetch('SEQUENCE', 1).to_i
    comment_sequence_length.times do |index|
      comment "Some comment ##{index + 1}"
      detail "Some detail ##{index + 1}"
    end

    test "Some test" do
      assert(result)
    end

    test "Some other test" do
      sleep 1

      assert(result)
    end
  end
end
