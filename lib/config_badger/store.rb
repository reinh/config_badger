module ConfigBadger
  module Store
    def self.included(base)
      base.send :include, ConfigBadger::Errors
      base.extend ConfigBadger::Assertions
      base.extend ConfigBadger::Options
    end
  end
end

