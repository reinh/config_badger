module ConfigBadger
  module Errors
    class ConfigError    < RuntimeError; end
    class OptionsError   < ConfigError;  end
    class StoreNotFound  < ConfigError;  end
    class EnvNotFound    < RuntimeError; end
  end
end
