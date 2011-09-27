module ConfigBadger
  module Store
    autoload :YAMLStore,  'config_badger/store/yaml_store'

    def self.included(base)
      base.send :include, ConfigBadger::Errors
      base.extend ConfigBadger::Assertions
      base.extend ConfigBadger::Options
      base.extend ConfigBadger::OptionsReader
    end
  end
end

