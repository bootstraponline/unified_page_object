require 'rspec'

# load unified_page_object from source
require_relative '../../lib/unified_page_object'

UnifiedPageObject.configure :web

require_relative 'pages/example_page'