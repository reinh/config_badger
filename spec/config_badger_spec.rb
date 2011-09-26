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
    before do
      ConfigBadger.options = { :path => 'config', :env => 'test' }
      File.stubs(:exists?).returns true
    end

    let(:file_path) { File.join('config', 'file.yml') }
    subject { klass.[]('file') }

    it "should load the YAML file from the path specified in options" do
      YAML.expects(:load_file).with(file_path).returns({'test' => {}})
      subject
    end

    it "should should add the .yml extension" do
      YAML.expects(:load_file).with(file_path).returns({'test' => {}})
      klass.[]('file')
    end

    context "when the file is unavailable" do
      before { File.expects(:exists?).returns false }

      it "should raise an error" do
        lambda { subject }.should raise_error ConfigBadger::ConfigNotFound
      end
    end

    context "when the file does not contain the Rails environment" do
      before { YAML.expects(:load_file).with(file_path).returns({'nonesuch' => {}}) }

      it "should raise an error" do
        lambda { subject }.should raise_error ConfigBadger::EnvNotFound
      end
    end

    context "when there is no :path option" do
      before { ConfigBadger.options = { :env => 'test' } }

      it "should raise an error" do
        lambda { subject }.should raise_error ConfigBadger::OptionsError
      end
    end

    context "when there is no :env option" do
      before { ConfigBadger.options = { :path => 'test' } }

      it "should raise an error" do
        lambda { subject }.should raise_error ConfigBadger::OptionsError
      end
    end

  end

end
