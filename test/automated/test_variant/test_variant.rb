require_relative '../automated_init'

context "Test Variant" do
  context "Passed" do
    fixture = Controls::Fixture.example

    session = fixture.test_session

    execution_break_thrown = catch(Session::ExecutionBreak) do
      fixture.test!(Controls::Title.example) do
        session.status = Controls::Status::Passed.example

        fixture.assert(true)
      end

      false
    end

    context "Execution break isn't thrown" do
      assert(execution_break_thrown == false)
    end
  end

  context "Failed" do
    fixture = Controls::Fixture.example

    session = fixture.test_session

    execution_break_thrown = catch(Session::ExecutionBreak) do
      fixture.test!(Controls::Title.example) do
        session.status = Controls::Status::Failed.example

        fixture.assert(true)
      end

      false
    end

    test "Execution break is thrown" do
      refute(execution_break_thrown == false)
    end
  end
end
