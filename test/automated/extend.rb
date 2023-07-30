require_relative 'automated_init'

context "Extend" do
  module_1 = Controls::Fixture::Object::Modules::Included
  module_2 = Controls::Fixture::Object::Modules::Extended

  object = Controls::Fixture::Object.example

  TestBench::Fixture.extend(object, module_1, module_2)

  context "First Module" do
    fixture_module_1 = module_1::Fixture

    extended = object.is_a?(fixture_module_1)

    test "Extended" do
      assert(extended)
    end
  end

  context "Second Module" do
    fixture_module_2 = module_2::Fixture

    extended = object.is_a?(fixture_module_2)

    test "Extended" do
      assert(extended)
    end
  end
end
