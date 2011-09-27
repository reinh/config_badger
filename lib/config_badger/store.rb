module ConfigBadger
  module Store
    def self.included(base)
      base.send :include, ConfigBadger::Errors
      base.extend ConfigBadger::Assertions
      base.extend ConfigBadger::Options
      base.extend ConfigBadger::OptionsReader
    end
  end
end

