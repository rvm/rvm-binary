 module RVMBinary
  module Tasks
    module List
      class VM < Thor

        desc 'vm', 'List available virtual machines'
        def vm
          puts "vm vm vm"
          puts Settings.binaries
        end

      end
    end
  end
end
