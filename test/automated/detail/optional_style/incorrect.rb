require_relative '../../automated_init'

context "Detail" do
  context "Optional Style" do
    context "Incorrect" do
      style = :incorrect_style

      fixture = Controls::Fixture.example

      test "Is an error" do
        assert_raises(Output::CommentStyle::Error) do
          fixture.detail(
            Controls::Text.example,
            style:
          )
        end
      end
    end
  end
end
