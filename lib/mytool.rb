require "mytool/version"
require "mytool/command"

module Mytool
  def self.cli_start
    Mytool::Command.start
  end
end
