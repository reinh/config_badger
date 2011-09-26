require 'spec_helper'

describe ConfigBadger do
  let(:klass) { ConfigBadger }

  describe ".options" do
    it "returns the options" do
      options = {}
      ConfigBadger.instance_variable_set('@options', options)
      ConfigBadger.options.should be_equal(options)
    end
  end

  describe ".options=" do
    it "sets the options" do
      options = {}
      ConfigBadger.options = options
      ConfigBadger.options.should be_equal(options)
    end
  end
end
