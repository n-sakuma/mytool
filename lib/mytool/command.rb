require 'thor'
require_relative "command/vim"

module Mytool
  class Command < Thor
    register(Mytool::Vim, 'vim', 'vim [COMMAND]', 'subcommand')
  end
end
