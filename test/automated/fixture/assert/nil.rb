require_relative '../../automated_init'

context "Fixture" do
  context "Assert" do
    context "Nil" do
      fixture = Controls::Fixture.example

      begin
        fixture.assert(nil)
      rescue Session::Failure => failure
      end

      test! "Failed" do
        refute(failure.nil?)
      end
    end
  end
end
