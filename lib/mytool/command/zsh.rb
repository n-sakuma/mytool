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

    desc 'update', 'update setting'
    def update
      dir = File.join(ENV['HOME'], '.zsh.d')
      if File.directory? dir
        FileUtils.chdir(dir) do
          git_status = `git status -s`
          if git_status.empty?
            if system("git pull")
              say "update success!", :cyan
            end
          else
            say "ZSH conf is not clean", :yellow
            puts git_status
          end
        end
      else
        say "ZSH setting update failed", :red
      end
    end
  end

end
