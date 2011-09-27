module ConfigBadger
  # Internal: Provides options_reader
  module OptionsReader
    # Internal: Creates an accessor for the option in ConfigBadger.options.
    # Also creates an assertion on that option name using
    # ConfigBadger::Assertions#assert_options!
    def options_reader(*names)
      names.each do |name|
        instance_eval <<-METH
        def self.#{name}                # def self.store
          assert_options! :#{name}      #   assert_options! :store
          options[:#{name}]             #   options[:store]
        end                             # end
        METH
      end
    end
  end
end
