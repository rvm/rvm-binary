require 'config'

module RVMBinary
  Config.load_and_set_settings('config.yml', 'config.local.yml')
end
