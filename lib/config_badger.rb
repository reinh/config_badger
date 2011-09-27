module ConfigBadger
  autoload :VERSION,    'config_badger/version'

  autoload :Assertions,    'config_badger/assertions'
  autoload :Errors,        'config_badger/errors'
  autoload :Options,       'config_badger/options'
  autoload :OptionsReader, 'config_badger/options_reader'

  # Stores
  autoload :YAMLStore,  'config_badger/store/yaml_store'

  include Errors
  extend Assertions
  extend OptionsReader

  class << self; attr_accessor :options; end
  options_reader :store, :env

  def self.[](name)
    cfg = store[name][env]
    raise EnvNotFound, "env not found `#{options[:env].inspect}`" unless cfg
    return cfg
  end
end
