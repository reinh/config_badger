module ConfigBadger
  autoload :VERSION,    'config_badger/version'

  # Modules
  autoload :Assertions,    'config_badger/assertions'
  autoload :Errors,        'config_badger/errors'
  autoload :Options,       'config_badger/options'
  autoload :OptionsReader, 'config_badger/options_reader'
  autoload :Store,         'config_badger/store'

  include Store

  class << self
    # Public: The ConfigBadger options.
    attr_accessor :options
  end

  # Internal: The store used to access config data
  options_reader :store

  # Internal: The environment namespace to use. For instance, Rails environment.
  options_reader :env

  # Public: Return the config Hash by name.
  #
  # name - The String name of the config data.
  #
  # Returns the config Hash
  def self.[](name)
    cfg = store[name][env]
    raise EnvNotFound, "env not found `#{options[:env].inspect}`" unless cfg
    return cfg
  end
end
