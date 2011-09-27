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

  describe ".[]" do
    before { ConfigBadger.options = { :store => {}, :env => 'test' } }

    [:env, :store].each do |opt|
      it "requires options[#{opt.inspect}]" do
        ConfigBadger.options[opt] = nil
        lambda { ConfigBadger['name'] }.should raise_error ConfigBadger::OptionsError
      end
    end
  end

  context "Hash storage" do
    before { ConfigBadger.options = { :store => {}, :env => 'test' } }

    it "gets the value from the hash" do
      ConfigBadger.options[:store]['test'] = 'test'
      ConfigBadger['test'].should == 'test'
    end
  end

  context "YAML Storage" do
    before { ConfigBadger.options = { :store => ConfigBadger::YAMLStore, :env => 'test', :path => 'config' } }

    [:path].each do |opt|
      it "requires options[#{opt.inspect}]" do
        ConfigBadger.options.delete(opt)
        lambda { ConfigBadger['name'] }.should raise_error ConfigBadger::OptionsError
      end
    end

    context "when the file does not exist" do
      before { File.stubs(:exists?).returns(false) }
      it { lambda { ConfigBadger['name'] }.should raise_error ConfigBadger::StoreNotFound }
    end

    context "when the file exists" do
      before { ConfigBadger.options = { :store => ConfigBadger::YAMLStore, :env => 'test', :path => 'config' } }
      before { File.stubs(:exists?).returns(true) }

      it "YAML loads the file" do
        YAML.expects(:load_file).with('config/name.yml').returns('test' => {})
        ConfigBadger['name'].should == {}
      end
    end
  end
end
