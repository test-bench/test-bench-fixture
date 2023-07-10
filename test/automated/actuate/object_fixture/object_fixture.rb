require_relative '../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    object = Controls::Fixture::Object.example

    block_argument = nil

    fixture = Fixture::Actuate::Object.(object) do |_block_argument|
      block_argument = _block_argument
    end

    test "Returns the object" do
      assert(fixture == object)
    end

    context "Block is executed" do
      executed = !block_argument.nil?

      test do
        assert(executed)
      end
    end

    context "Block Argument" do
      test "Is the object" do
        assert(block_argument == object)
      end
    end

    context "Object is extended" do
      extended = object.is_a?(Fixture)

      test do
        assert(extended)
      end
    end
  end
end
