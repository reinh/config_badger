require 'yaml'

module ConfigBadger
  module YAMLStore
    include ConfigBadger::Errors
    extend ConfigBadger::Assertions
    extend ConfigBadger::Options
    extend ConfigBadger::OptionsReader

    options_reader :path

    def self.[](name)
      full_path = File.join(path, name.to_s + '.yml')
      raise StoreNotFound, "store not found at `#{full_path}`" unless File.exists?(full_path)
      YAML.load_file(full_path)
    end
  end
end