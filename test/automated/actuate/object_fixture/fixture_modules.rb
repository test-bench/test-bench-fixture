require_relative '../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Fixture Modules" do
      object = Controls::Fixture::Object.example

      control_fixture_modules = Controls::Fixture::Object.fixture_modules
      fixture_modules = Fixture::Actuate::Object.fixture_modules(object)

      fixture_modules_text = fixture_modules.map { |mod| "#{mod}\n" }.join
      control_fixture_modules_text = control_fixture_modules.map { |mod| "#{mod}\n" }.join

      comment fixture_modules_text
      detail "Control:", control_fixture_modules_text

      test do
        assert(fixture_modules == control_fixture_modules)
      end
    end
  end
end
