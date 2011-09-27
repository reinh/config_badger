module ConfigBadger
  # Internal: Various methods used to enforce method contracts.
  #
  # Examples
  #
  #   assert_options! :source, :env
  module Assertions
    # Internal: Assert that ConfigBadger.options contains the specified keys.
    #
    # names - The options names that are required.
    #
    # Raises ConfigBadger::Errors::OptionsError if ConfigBadger.options does not contain the key or the key is falsey
    def assert_options!(*names)
      names.each do |name|
        raise ConfigBadger::OptionsError, "must specify options[#{name.inspect}]" unless ConfigBadger.options[name]
      end
    end
  end
end
