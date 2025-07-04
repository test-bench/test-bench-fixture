require_relative '../automated_init'

context "Context" do
  context "Type Error" do
    title_argument = Object.new

    fixture = Controls::Fixture.example

    test do
      assert_raises(TypeError, "can't convert Object into String") do
        fixture.context(title_argument) {}
      end
    end
  end
end
