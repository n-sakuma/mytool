require 'thor'
require_relative "command/vim"
require_relative "command/zsh"

module Mytool
  class Command < Thor
    desc 'setup_all', "setting up all."
    def setup_all
      invoke 'vim:install'
      invoke 'zsh:install'
    end

    desc 'update_all', "update setting"
    def update_all
      invoke 'vim:update'
      invoke 'zsh:update'
    end

    register(Mytool::Vim, 'vim', 'vim [COMMAND]', 'Vim controll')
    register(Mytool::Zsh, 'zsh', 'zsh [COMMAND]', 'Zsh controll')
  end
end
