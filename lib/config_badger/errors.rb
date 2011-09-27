module ConfigBadger
  module Errors

    # Internal: The base RuntimeError for ConfigBadger errors.
    class ConfigError < RuntimeError; end

    # Public: An error with ConfigBadger.options, typically a missing requirement.
    class OptionsError < ConfigError; end

    # Public: The store specified in ConfigBadger.options is unavailable.
    class StoreNotFound < ConfigError; end

    # Public: The environment specified in ConfigBadger.options was not found.
    class EnvNotFound < RuntimeError; end
  end
end
