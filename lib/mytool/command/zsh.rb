require "thor"

module Mytool

  class Zsh < Thor
    include Thor::Actions
    namespace :zsh

    desc 'install', "set up zsh"
    def install
      if File.directory? File.join(ENV['HOME'], '.zsh.d')
        say "Zsh config is already exist!", :yellow
      else
        if system("git clone git@github.com:n-sakuma/zsh.d.git ~/.zsh.d")
          say "clone success!", :cyan, :bold
          # TODO symlink
        else
          say "faild!", :red
        end
      end
    end

  end

end
