require_relative '../../../automated_init'

context "Actuate" do
  context "Fixture Class" do
    context "Build Fixture" do
      context "Constructor Accepts A Test Block" do
        block_argument = proc { }

        context "Build Method" do
          fixture_class = Controls::Fixture::Class::TestBlock::BuildMethod

          fixture = Fixture::Actuate::Class.build_fixture(fixture_class, &block_argument)

          context "Test Block" do
            test_block = fixture.test_block

            test "Supplied to fixture" do
              assert(test_block == block_argument)
            end
          end
        end

        context "No Build Method" do
          fixture_class = Controls::Fixture::Class::TestBlock::NoBuildMethod

          fixture = Fixture::Actuate::Class.build_fixture(fixture_class, &block_argument)

          context "Test Block" do
            test_block = fixture.test_block

            test "Supplied to fixture" do
              assert(test_block == block_argument)
            end
          end
        end
      end
    end
  end
end
