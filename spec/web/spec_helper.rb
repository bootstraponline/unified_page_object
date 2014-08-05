require 'singleton'

require 'rubygems'
require 'rspec'

# load unified_page_object from source
require_relative '../../lib/unified_page_object'

# configure
UnifiedPageObject.configure :web

# page objects
require_relative 'pages/example_page'

# $driver.driver
$driver = Class.new do
  include Singleton

  def driver
    @driver ||= Selenium::WebDriver.for :firefox
  end
end.instance

UnifiedPageObject.define_page_methods ::Pages

# close browser after tests complete
RSpec.configure do |config|
  config.after :all do
    $driver.driver.quit if $driver.driver
  end
end