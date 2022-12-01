require_relative '../../automated_init'

context "Fixture" do
  context "Context" do
    context "Variant" do
      context "Title" do
        title = Controls::Title::Context.example

        context "Pass" do
          fixture = Controls::Fixture.example

          begin
            fixture.context! title do
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
            fixture.context! title do
              fixture.test_session.record_failure
            end
          rescue Session::Abort => abort
          end

          test "Aborts" do
            refute(abort.nil?)
          end
        end
      end

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
