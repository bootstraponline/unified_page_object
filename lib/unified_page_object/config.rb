module UnifiedPageObject
  class << self
    # Configures UnifiedPageObject to the target platform.
    #
    # @param platform [Symbol] the platform to target
    # @return [void]
    def configure platform
      valid = [:web]
      raise "Invalid platform '#{platform}'. Valid values: #{valid}" unless valid.include? platform

      case platform
        when :web
          require 'page-object'
      end

      nil
    end
  end
end