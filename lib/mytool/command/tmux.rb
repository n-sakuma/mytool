require "thor"

module Mytool

  class Tmux < Thor
    include Thor::Actions
    namespace :tmux

    desc 'install', "set up tmux"
    def install
      if File.directory? File.join(ENV['HOME'], '.tmux.d')
        say "tmux config is already exist!", :yellow
      else
        if system("git clone git@github.com:n-sakuma/tmux.d.git ~/.tmux.d")
          say "clone success!", :cyan, :bold
          # TODO symlink
        else
          say "faild!", :red
        end
      end
    end

    desc 'update', 'update setting'
    def update
      dir = File.join(ENV['HOME'], '.tmux.d')
      if File.directory? dir
        FileUtils.chdir(dir) do
          git_status = `git status -s`
          if git_status.empty?
            if system("git pull")
              say "update success!", :cyan
            end
          else
            say "tmux conf is not clean", :yellow
            puts git_status
          end
        end
      else
        say "tmux setting update failed", :red
      end
    end
  end

end
