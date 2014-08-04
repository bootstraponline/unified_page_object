module UnifiedPageObject

  def define_page_methods page_module, test_class=RSpec::Core::ExampleGroup
    page_module.constants.each do |page_class|
      # set page name before the class is fully qualified.
      # ButtonsPage => buttons_page
      page_name  = page_class.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase

      # Pages::ButtonsPage
      page_class = Pages.const_get page_class # transform symbol into fully qualified reference

      page_class.include Singleton

      # https://github.com/cheezy/page-object/blob/27c601042b3b7c1c1816b207c41cf43d7be95908/lib/page-object.rb#L59
      # todo: support the rest of the page-object init method
      page_class.class_eval do
        def initialize
          initialize_browser $driver.driver
        end
      end

      Minitest::Spec.send(:define_method, page_name) do
        page_class.instance
      end
    end
  end
end