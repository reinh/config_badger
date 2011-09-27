# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :cli => '-c', :notify => false, :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

# Add files and commands to this file, like the example:
#   watch('file/path') { `command(s)` }
#
guard 'shell' do
  watch(/(.*)\.(rb|rdoc)/) {|m| puts `rake rdoc` }
end
