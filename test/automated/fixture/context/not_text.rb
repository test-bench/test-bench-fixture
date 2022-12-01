require_relative '../../automated_init'

context "Fixture" do
  context "Context" do
    context "Not Text" do
      title = Object.new

      fixture = Controls::Fixture.example

      test "Is a NoMethodError" do
        assert_raises(NoMethodError, "undefined method `to_str' for #{title.inspect}") do
          fixture.context title do
            #
          end
        end
      end
    end
  end
end
