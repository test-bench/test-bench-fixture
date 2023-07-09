require_relative '../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Included Modules" do
      object = Controls::Fixture::Object.example

      control_included_modules = Controls::Fixture::Object::Modules.included
      included_modules = Fixture::Actuate::Object.included_modules(object)

      included_modules_text = included_modules.map { |mod| "#{mod}\n" }.join
      control_included_modules_text = control_included_modules.map { |mod| "#{mod}\n" }.join

      comment included_modules_text
      detail "Control:", control_included_modules_text

      test do
        assert(included_modules == control_included_modules)
      end
    end
  end
end
