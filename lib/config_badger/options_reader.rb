module ConfigBadger
  module OptionsReader
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
