require 'rspec'

# load unified_page_object from source
require_relative '../../lib/unified_page_object'

# page objects
require_relative 'pages/example_page'

# configure

UnifiedPageObject.configure :web

# $driver.driver
$driver = Class.new do
  def self.driver
    #@@driver ||= Selenium::WebDriver.for :firefox
  end
end

UnifiedPageObject.define_page_methods ::Pages