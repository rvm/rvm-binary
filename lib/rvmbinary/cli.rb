require 'thor'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'tasks', '**/*.rb'))].each {|file| require file }

module RVMBinary
  class CLI < Thor
    Tasks.constants.each do |const|
      self.include Tasks.const_get const
    end
  end
end
