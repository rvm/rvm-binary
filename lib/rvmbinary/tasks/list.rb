module RVMBinary
  module Tasks
    module List
      def self.included(thor)
        thor.class_eval do

          desc 'dupa', 'dupa 2'
          subcommand "vm", VM

          desc 'list [vm|binary|branch]', 'List available resources: virtual machines, binary builds or branches to test'
          # method_option :vm, aliases: 'os', desc: 'list available virtual machines'
          # method_option :binary, desc: 'list build binaries'
          # method_option :branch, desc: 'list available branches for testing'
          def list(resource)
            # puts "#{resource}"
            # puts Settings.binaries
            puts "list"
          end
          
        end
      end
    end
  end
end