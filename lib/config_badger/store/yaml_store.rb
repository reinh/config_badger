require 'yaml'

module ConfigBadger
  module Store
    # Public: Local disk YAML storage.
    #
    # Required options:
    #
    # :path - The location of the YAML config files.
    # :env  - The name of the config environment namespace.
    module YAMLStore
      include Store

      options_reader :path

      # Internal: The interface used by ConfigBadger.[].
      #
      # name - the String config name.
      #
      # Required options:
      #
      # :path - The location of the YAML config files.
      # :env  - The name of the config environment namespace.
      def self.[](name)
        full_path = File.join(path, name.to_s + '.yml')
        raise StoreNotFound, "store not found at `#{full_path}`" unless File.exists?(full_path)
        YAML.load_file(full_path)
      end
    end
  end
end
