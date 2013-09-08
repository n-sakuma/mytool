require 'thor'
require_relative "command/vim"
require_relative "command/zsh"

module Mytool
  class Command < Thor
    register(Mytool::Vim, 'vim', 'vim [COMMAND]', 'subcommand')
    register(Mytool::Zsh, 'zsh', 'zsh [COMMAND]', 'Zsh controll')
  end
end
