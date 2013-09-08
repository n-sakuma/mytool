require "thor"

module Mytool

  class Vim < Thor
    include Thor::Actions
    namespace :vim

    desc 'install', "set up vim"
    def install
      if File.directory? File.join(ENV['HOME'], '.vim')
        say "Vim confif is already exist!", :yellow
      else
        if system("git clone git@github.com:n-sakuma/dot.vim.git ~/.vim")
          say "clone success!", :cyan, :bold
        else
          say "faild!", :red
        end
      end
    end

    desc 'update', 'update setting'
    def update
      dir = File.join(ENV['HOME'], '.vim')
      if File.directory? dir
        FileUtils.chdir(dir) do
          git_status = `git status -s`
          if git_status.empty?
            if system("git pull")
              say "update success!", :cyan
            end
          else
            say "Vim conf is not clean", :yellow
            puts git_status
          end
        end
      else
        say "Vim setting update failed", :red
      end
    end
  end

end
