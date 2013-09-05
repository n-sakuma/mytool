require 'thor'

module Mytool
  class Command < Thor
    include Thor::Actions

    desc "vim", "My vim setting"
    def vim
      say "vim", :cyan
    end

  end
end
