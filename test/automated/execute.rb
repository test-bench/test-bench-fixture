require_relative 'automated_init'

context "Execute" do
  fixture = Controls::Fixture.example

  file_path = Controls::Path::File.example
  fixture.execute(file_path)

  context "Isolate" do
    isolate = fixture.test_session.isolate

    test "Executed" do
      assert(isolate.executed?(file_path))
    end
  end
end
