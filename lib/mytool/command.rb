require 'thor'
require_relative "command/vim"
require_relative "command/zsh"
require_relative "command/tmux"
require_relative "command/devenv_gems"

module Mytool
  class Command < Thor
    desc 'setup_all', "setting up all."
    def setup_all
      invoke 'vim:install'
      invoke 'zsh:install'
      invoke 'tmux:install'
      invoke 'gems:install'
    end

    desc 'update_all', "update setting"
    def update_all
      invoke 'vim:update'
      invoke 'zsh:update'
      invoke 'tmux:update'
      invoke 'gems:update'
    end

    register(Mytool::Vim, 'vim', 'vim [COMMAND]', 'Vim controll')
    register(Mytool::Zsh, 'zsh', 'zsh [COMMAND]', 'Zsh controll')
    register(Mytool::Tmux, 'tmux', 'tmux [COMMAND]', 'Tmux controll')
    register(Mytool::DevenvGems, 'gems', 'gems [COMMAND]', 'Dev env gems controll')
  end
end
