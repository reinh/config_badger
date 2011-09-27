module ConfigBadger
  module Assertions
    def assert_options!(*names)
      names.each do |name|
        raise ConfigBadger::OptionsError, "must specify options[#{name.inspect}]" unless ConfigBadger.options[name]
      end
    end
  end
end
