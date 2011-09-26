require 'yaml'

module ConfigBadger
  autoload :VERSION, 'options_badger/version'

  class ConfigError    < RuntimeError; end
  class OptionsError   < ConfigError;  end
  class ConfigNotFound < ConfigError;  end
  class EnvNotFound    < RuntimeError; end

  def self.options
    @options ||= {}
  end

  def self.options=(options)
    @options = options
  end

  def self.[](name)
    assert_options! :path, :env

    file = name + '.yml'

    config_file = File.join(options[:path], file)

    raise ConfigNotFound, "config not found `#{name}` in #{config_file}" unless File.exists?(config_file)

    config = YAML.load_file(config_file)[options[:env]]

    raise EnvNotFound, "env not found `#{options[:env]}` in #{config_file}" unless config

    return config
  end

  def self.assert_options!(*names)
    names.each do |name|
      raise OptionsError, "must specify options[#{name.inspect}]" unless options[name]
    end
  end
end
