require 'yaml'

module ConfigBadger
  autoload :VERSION, 'options_badger/version'

  class ConfigError    < RuntimeError; end
  class ConfigNotFound < ConfigError;  end
  class EnvNotFound    < RuntimeError; end

  def self.options
    @options ||= {}
  end

  def self.options=(options)
    @options = options
  end

end
