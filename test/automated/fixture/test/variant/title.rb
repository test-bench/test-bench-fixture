require_relative '../../../automated_init'

context "Fixture" do
  context "Test" do
    context "Variant" do
      context "Title" do
        title = Controls::Title::Test.example

        context "Pass" do
          fixture = Controls::Fixture.example

          begin
            fixture.test! title do
              fixture.test_session.record_assertion
            end
          rescue Session::Abort => abort
          end

          test "Doesn't abort" do
            assert(abort.nil?)
          end
        end

        context "Failure" do
          fixture = Controls::Fixture.example

          begin
            fixture.test! title do
              fixture.fail
            end
          rescue Session::Abort => abort
          end

          test "Aborts" do
            refute(abort.nil?)
          end
        end
      end
    end
  end
end
