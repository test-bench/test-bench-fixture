require_relative '../../automated_init'

context "Actuate" do
  context "Fixture Class" do
    context "Test Block Predicate" do
      context "Test Block" do
        context "Build Method" do
          fixture_class = Controls::Fixture::Class::TestBlock::BuildMethod

          test_block = Fixture::Actuate::Class.test_block?(fixture_class)

          test do
            assert(test_block)
          end
        end

        context "No Build Method" do
          fixture_class = Controls::Fixture::Class::TestBlock::NoBuildMethod

          test_block = Fixture::Actuate::Class.test_block?(fixture_class)

          test do
            assert(test_block)
          end
        end
      end

      context "No Test Block" do
        fixture_class = Controls::Fixture::Class::TestBlock::None

        test_block = Fixture::Actuate::Class.test_block?(fixture_class)

        test do
          refute(test_block)
        end
      end

      context "Not A Fixture Class" do
        cls = Class.new

        test "Is an error" do
          assert_raises(Fixture::Actuate::Class::Error) do
            Fixture::Actuate::Class.test_block?(cls)
          end
        end
      end
    end
  end
end
