require_relative '../../../automated_init'

context "Fixture" do
  context "Context" do
    context "Variant" do
      context "No Title" do
        context "Pass" do
          fixture = Controls::Fixture.example

          begin
            fixture.context! do
              #
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
            fixture.context! do
              fixture.fail!
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
